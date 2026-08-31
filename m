Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB54C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 12:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Yumoe7FZSNCoT/Inpg12IKhKN/8sBU4yATdWXPVHv8=; b=e4Z8vWNONkW7/zWb2xB4ZV1jM5
	8EZG3tCkX7AUzkaDDUy7xNCNdre04Q0O4feTL2zUirMT/j0q1DqBMSTwkypAita4vFeaDnffnMq0o
	hAqXzIngmP9M6UcMLpZzj/ln+H3keCqTS8FXkDdRO72FjsxKb1aQDvyDBOdm+RIbCiGsqezY43q44
	g8YUSpJbR3Cbjxu6CDMKXSipyGl1VLHPbo7JMFLoPMOUVHuL9JM0uge8u611aoGgZUWyKP1l5SR0R
	FH+X7XwAKtUMyTXAwYOxGzK4sR9rrCdeE2t+x/rWx2HxWU5OeYE9yKY473reoEyWo629rUUXoVlY7
	X05hA1dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11SG-00000009KgV-0toj;
	Mon, 31 Aug 2026 12:49:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11SE-00000009Kff-0lzF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 12:49:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso39239485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788180576; x=1788785376; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Yumoe7FZSNCoT/Inpg12IKhKN/8sBU4yATdWXPVHv8=;
        b=I1vyQiPHWoztLpwZmWRJrdjjwEg0eo/9zR//QcD0noihLfufC1V1+G+HDxE1x9yxNd
         rZyhGK+nC1X//SQteuWy5P938u+mzZZqQCcMANrc02iyiwUzvbylZ2KQCvQ2dL2/WgMW
         DXRJk/aWpgAysGaWq7qaBWRqbCVEYEmgyzeAGMKCNaQwqD9sz6/9/AXQMRf39Cc1ouEb
         XmJ4NonyQ6rivSbQp5MNxFBGScls+7h02/fZFPEI+wjbA5rOq+1iGwxfkzD3pxPAorho
         g/hwKqnMOdF1b7RZ8o44JGEmirVwvmM5BgUuFw2iKjxs61f6FruyM/YXEm1fGrpBi13b
         LqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180576; x=1788785376;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Yumoe7FZSNCoT/Inpg12IKhKN/8sBU4yATdWXPVHv8=;
        b=GQlMB+jVTv2KHlF8jg9yq60jgUl8KvB3AN/QSvcHK1/jjW6dq02Vx/tLBdz0BMtheA
         1/0r/qihl59wY2RHHdzvgoFtBdMf7e8J1E4vz+MxgHvuITj+rf4JMPd+jyEks+aLAAIz
         yKEpfglDalTtg25yFpnpHCsL9at3SovvQ/ZOS58gEpfJedhXsb1vNYo9LTldFpahbbtL
         Dfz08IM8R+Fv0czWRvWadJORChfQOtO1o1V87/HcJ3T2EC34qD5tGFhFgjE4pBYmrOBF
         1aakjBU5bYXCG0gcfpZiIJq0jYvHIZYmyWtOHWNbL9YminSryfhtfuaT8AYM4LiiY8IF
         NIGw==
X-Forwarded-Encrypted: i=1; AHgh+RrqeLpXMJ01l8t2cdXAFZTyJ3+y6Jrf+BYoL+LLIUvyZYFrgWeYhcz8Qw2bpWPks0DkgAT06+X2NZIqFrtnTZ/w@lists.infradead.org
X-Gm-Message-State: AFuF++kiJqjhODNPHaBSHI4Y9sKx6EWojEKm/Pp/iNgj/sef4gXoD6ci
	8AX/IEE2DlE0arRMLuKbnA5998IlNzAnDzYkUiTrfCq+hoGr4X/zARC5PJH15iEd5u0=
X-Gm-Gg: AR+sD12LH+xpWFeB6jbn4GU0n89h2I9cEnVe/85e4L7Joo6hrefRKRTg37Gta+vgQgp
	YHr9C1B23GW88E+Afxp0qsHFGjaqlbXuAN0IYARpROjVYqea1X3jvfvuqmMt2l0umkxpIJFUMR2
	mUpQFTV252HIM9FhUW0B7e8WRKmm09jPLyYaVaOL+BcxrbrL2u6yCckXNmRIQgwvcGrYo63WMuY
	hF7bVR5WbZ7+EF7Q6nIa9mx6IUDKLyH4yqvaDlqc8DulUtYuVJivLASWTZGG818bVB/3qGDLjJ1
	pcoCE8xVGfOghd7Q6k95BjzmwyP69IWEBb4elv9sFVWrFBs49Sgw25YNnUTRaZZy6M7s+nDMLq/
	n4NtaD5tovdbOpoCObJj2xRDEnGR2KZr2mRhlKI+vBxLH02Oh265205hcT9EM8pvvvSS6M+LMDD
	7hhpLYdamCndu86UadH5ED5U7jQrbUU8dkL52RyXXjfh4oSA4v1p5h/UfdOngVEtRb6x5jJ5J6A
	pv0ejCfIg==
X-Received: by 2002:a05:600c:19ca:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-49ccee0f3cdmr203606555e9.16.1788180576048;
        Mon, 31 Aug 2026 05:49:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0e:1005:fa8b:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2922ebdsm164736385e9.3.2026.08.31.05.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:49:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260829193939.107564-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829193939.107564-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: amlogic: Replace spaces indentation with
 tabs
Message-Id: <178818057398.2326859.6686364977974372286.b4-ty@b4>
Date: Mon, 31 Aug 2026 14:49:33 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_054938_296373_B72D6894 
X-CRM114-Status: GOOD (  10.97  )
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

On Sat, 29 Aug 2026 21:39:40 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.4/arm64-dt)

[1/1] arm64: dts: amlogic: Replace spaces indentation with tabs
      https://git.kernel.org/amlogic/c/6b59171d0fe541438da68c19541cd2f31c60ac04

These changes has been applied on the intermediate git tree [1].

The v7.4/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


