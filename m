Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4995CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 12:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOt16YkryKexmXJipwSE2igWxVT46laeHn0nxx/qJ1E=; b=Hcbzac9bGS8+TMXbe6oyRhX8eN
	x3WCRNDSe/Wv0GWIsMvPFrVy0UqghaEs5xJstkTuYMwSNYQYaOY+ql/y494I8c0B/a6vjrtt6r/s7
	VXYxpAPs5/kYk2v+HfVp3goO6q2g0t3t9naQ7qSdgH61F43xVN1dLvrhRn0Sx+IFE74nphad+6l3J
	rOjPUtV5A7YE4OfLE72RDM2yc25Xym59T6Km5uzcPCykn4kNx6F04W8Oj8lPoQOocPrpgeSGN2Aaw
	emA/xlBVoSrCW+sU9NK4rk3c25h8o4VdqwS3FYnBbcTlRiYdiGaaPRAlvCytUIV8E22geKd9TUpSm
	mQ8T7ByA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8pp-00000002VUl-37BO;
	Wed, 13 May 2026 12:37:09 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8pm-00000002VSE-27Ch
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 12:37:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48d102471a4so67026545e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 05:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675824; x=1779280624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOt16YkryKexmXJipwSE2igWxVT46laeHn0nxx/qJ1E=;
        b=Prm32rwLTAlcrQYdtd4fa+gl+K8n2yD96slHlhKf87F9sVl3/L9/qLPIGTG6gGKKCx
         BV4GB41X9sDRPF3qv1xpzM7W4ouOtIAsDJLnPync+AbMCX+x16YXhmRWxjHAoV0IdW/3
         Fr3TxlGT/bEm3NUZ30GfsJ1yFt4K8g/eJLcoSKDKlgqq8/oMTOusZxZXT5jIYGqBVjMT
         nYOKjpoU3ULMSv/rZxKYO90GOrLPTwcWcoKOCOmiZFbCqBmoCbtnrWQIBL34dGiODszA
         qsC8pOGqI6xNCi+lXAf2OXB4t81UU/0gp7S0E90eyWq6N3JN4GkdHUs+XuFX2QzBxzrD
         ZrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675824; x=1779280624;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YOt16YkryKexmXJipwSE2igWxVT46laeHn0nxx/qJ1E=;
        b=e8GSN7ac5D9vdoEyT89tuNgYq6pl/36ZaOzAORUbEL3Gt9nnZjyIk31b7iJbftSW8/
         HC/VhHEW3T5y02vDejA3NhuopowkKIKmLMsdhqY7tXuWoW+EOiOv/pPsSCYi5awk0szr
         +nRxBti4oUpLYAsN4kwupxYrxRzUpZNrbE0Jor0Vma85Lccf9aOcEkwyJk+vPadRBCBi
         Za9JE5ZxVhqiKodjBuQjLv0Djg0Sxzqhezo6pB7TEl1+1b4v0JHePLU82nPUQ2hOz4+6
         Xs0oLTTH/f25to5g1X1GPZHr0NUTAmXj3tYSeHKj50l5mFY98jjpAxIzbinld9onHwl/
         VQoA==
X-Gm-Message-State: AOJu0Yz4l1clBeZYQ5hvFV8mVKhK1k5qDb1C87mbHNlugCmRzrW7lWVu
	3Xfm7O1y5pwnaPXNRyThvnjOGPtws7VEMWkUn6Wtcd+sHXh9ZoAZoN78VvySwmGz4lI7vrSEkMF
	4h5AvyvU=
X-Gm-Gg: Acq92OGzCbuHw9+3yTPfaZOk+v1tbf92u3qBGKLTfewyjuJEeQfwmPi66gi+65fgg7n
	h4IgOtZEB4jj6JiReCxv80EbDZK7AbxnRsgsHClGzZBpmydq035HZFZLFgtQcWq0tRp2RoPvG7C
	crwyMTO7twDAMd6AnhHBUUhJ0562Kr9WrFBEAYUqyEGYSpK55QNyWERU8MH9AzVjt5Buawd3xbm
	dnM/TpHlKPKM56LJN/FTuce4Ishgc+Vg4pIuCyY3bvwTjNfEBc9o73iMb73F3ou8/YExwG7ITqe
	spEjAg+61ZPzhuIQvBqT16gMry34t15rO0n6EEtoyEhi5LCzFNNJ3cBZfnbVgXCh4GoCKFy9knb
	boulShgd5xq+8oJnqgNJ03soCwbzQRSkhtuYz24NGEAq0/LS8KUOW6BkxHoIVosXimLdptwgrpw
	mvfkQTn7zBtcQcuodtz4NzRj5Pn0g4VzDLthGYW7P7BVY5
X-Received: by 2002:a05:600c:3ba2:b0:48a:563c:c8d6 with SMTP id 5b1f17b1804b1-48fc9a0dd8cmr50279545e9.7.1778675824336;
        Wed, 13 May 2026 05:37:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d74536sm75006895e9.15.2026.05.13.05.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260331-fix-aml-t7-null-reset-v1-2-eb95b625234c@aliel.fr>
References: <20260331-fix-aml-t7-null-reset-v1-2-eb95b625234c@aliel.fr>
Subject: Re: (subset) [PATCH 2/2] arm64: dts: amlogic: t7: Fix missing
 required reset property
Message-Id: <177867582359.1433419.10249035871609628577.b4-ty@b4>
Date: Wed, 13 May 2026 14:37:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_053706_555320_130C281C 
X-CRM114-Status: GOOD (  11.01  )
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

On Tue, 31 Mar 2026 16:24:05 +0200, Ronald Claveau wrote:
> CHECK_DTBS shows missing reset required property in T7 DTBS.
> A new CHECK_DTBS with this patch does not show this anymore.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.2/arm64-dt)

[2/2] arm64: dts: amlogic: t7: Fix missing required reset property
      https://git.kernel.org/amlogic/c/068bad69dc4d3ffdd8ecf41b455cc9e1617d00bc

These changes has been applied on the intermediate git tree [1].

The v7.2/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


