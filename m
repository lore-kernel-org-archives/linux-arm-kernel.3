Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04584C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 09:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0/o+BxhL5sTQiBioNkExLmkkWnNW1Q5SLBaV4tIgPk=; b=L88HfWrsCvSPKLukBvmRpwbWEf
	iPKKiu4IPm/4yFXB+aHGQFTMXYStvlMGo9wpAfjqjadPp+AqGsyjqR/TE7Rdlg2PR/PjVo4S1US5u
	ZZXo8ATefxUYd58+a3Tpa40Jr1Y9cRyqUlRkIXiaY573bbUO7TLzMomB/FekjMTgTvnZh0QCY+V7O
	0hKrttESFgLHY5uLPeGMxaDeh0nqjkyzG+VfH9b+B20Pdm/tu9y10xja168Q7QlaYseWLRqj06H4A
	Vc1WKKgz4ItIflshWyzKJx2TPCX0wjgi3834aFQweDmS1m6IEn9poiXMjRGXzM4WeP0uG6XNqLKeU
	6QCUeHIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaYf-00000006WFd-38QF;
	Fri, 03 Jul 2026 09:51:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaYd-00000006WEn-0uvj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 09:51:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so2548665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 02:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783072297; x=1783677097; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a0/o+BxhL5sTQiBioNkExLmkkWnNW1Q5SLBaV4tIgPk=;
        b=SKl+bHt1y+q5jHeiNb7S2dkyUfMndb02X19TrU8iAPOfbcIo3jxA9w7YHnuMMTEebx
         3ulPUe2BpX3zFX6Ncv9zPjivC5RPs2ZrSG294rzfAjGalTxkLn1OQJRlJ23I1Lq0MES7
         V2TPPHmfhjfaL+hc0VgoM74sUUBLAtrYW5tAk9/7ROvKIUcyY1ByLCMN4ChZyTyd2rZe
         eyadfTff5k+Yn/NY4v5OgonQ18Nz8EvR900XuIO89Cosz4sK9cTZSEy5mT3krb7EIsyO
         3YQ93FYAzM6WPfDXIHaUzg05w2SGS+ufrzhn43WfrN6c7TcTstv+qL0+NryAREifvxdj
         YBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783072297; x=1783677097;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0/o+BxhL5sTQiBioNkExLmkkWnNW1Q5SLBaV4tIgPk=;
        b=mnp16Ug+JH9JYPjm6bX1PwjP0KqyjSMajMUQ/LmYQmtbK7NdRq08Sd1BOQk9yUIb9h
         mxBGTINORYUSRk2kJWSCuj50Awi/eqBC8b0IopPkYEBhDM4GCboxGKRpQSAxh/HZ95PW
         3EEvtIaJHl6LFKQ147oBNxgrSpRDVXNONJ+pvTBEd8hTQEpgmmBx8a2OJ5rWV7bgbjyc
         Iq6lCHjfJJNNeZI89uqC695BXdhkheAZ/UR3XLyGcEPJiSnpIS9CnqSk9k08+coW2lrY
         vWD80B/Ih78rzr9WLjcenHML0Z1Lal0MR+AF9uoM+C9swnxLjeI8aEry6r+l2AuzmhZV
         +JCQ==
X-Forwarded-Encrypted: i=1; AFNElJ8KPy79ENf/RU5LwVpSl/njGTEP5WT2sn398KOkHbg9G+tLvHypr7cSAU4B+nr008F8X1jlMefgUXnc3b9tS1dq@lists.infradead.org
X-Gm-Message-State: AOJu0YyjzO53Qlocuf+Yhczz3P7rnxTRVzD+NZ4Sacwnkm85yOmXPXXQ
	g4LNgDxea9NuXsOAARNBKGq4C9kwCs4azVYRjTmuA3Jk0/nPEwoQDxx2qfUNW/ZnmImqnv9eJ0o
	rsMcy
X-Gm-Gg: AfdE7clLo777IDpIqTtvm1XK5GOt2DKMqQ7lbplZL64GLEph06nnw0AaZ1ro2Wn0iM8
	LmNE/FbJzNVPOwn1fykDYc1d4EMVdBVE64FcVKUazBibOxarfj8UjBdHZk9Y70wlmr8PoEnwWIm
	vDJ8+6tZWyTQoeJaW7da/JFDCFnM15+l8vxQF6Yy4j+e5z0u6IMN3Yz+9FquQ4tJsJEBzwpp/kS
	2wi8ISHvfCmBk269f3e7AQu4v/Oq1tVOwJ4dNEvBiwmKBDf1GnRejY5Rc81mjXInJM5tW84GFok
	GqX/NA4/z0ATb8DGU+xQy4zAlFoUZbNwQ7kC5ByEtwOfbmZ9HrYvJjApZdF47dmOOMkfqLHK9Jv
	5A/NXGO2DLIcyFNfayvl/iCXG9thP/RfLfm2tWG0MH5f5llnLKHuA5VBKw88jaFgfPBC0mijjjI
	HcYFwtyLhMsNJbielwn3wnYJsNygdAJJTcE5CHjSXB9h0V
X-Received: by 2002:a05:600d:840c:10b0:493:b9cd:1272 with SMTP id 5b1f17b1804b1-493c3cf2f50mr96587925e9.23.1783072297045;
        Fri, 03 Jul 2026 02:51:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm16710140f8f.24.2026.07.03.02.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 02:51:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
References: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/4] soc: amlogic: clk-measure: add A1 and
 T7 support
Message-Id: <178307229627.3254712.12197309292158479320.b4-ty@b4>
Date: Fri, 03 Jul 2026 11:51:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_025139_270195_C3BF59B7 
X-CRM114-Status: GOOD (  10.49  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, 21 Apr 2026 16:17:40 +0800, Jian Hu wrote:
> This series adds Amlogic clock measurement support for A1 and T7 SoCs,
> including binding updates, driver additions, and device tree enablement.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.3/drivers)

[1/4] dt-bindings: soc: amlogic: clk-measure: Add A1 and T7 compatible
      https://git.kernel.org/amlogic/c/457462828d08514fbf53a385c0cd39bf597adf63
[2/4] soc: amlogic: clk-measure: Add A1 and T7 support
      https://git.kernel.org/amlogic/c/8bfdc0393b3f3d6aaa1203e889ef9e96a50b28a2

These changes has been applied on the intermediate git tree [1].

The v7.3/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


