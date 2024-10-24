Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66C1D0BB4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 01:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbcd5uRapQhQxq5MJJTWR2sL5XsG0N0yna5jn5lare0=; b=RguV1XjMOBqGKWtEi07SLq+et+
	duZvZiRkM08uJ5iyyETfbto0GMW6qZdK3p9FNT5UiGxicqYn1LTDboI+hOWfKly4KpM6i4RVqsvIo
	aJrTRE1v3Hn8G9082FvNaXdQ4lEWQLi+0LBoEigl/P3BJH08ClQjZIB2+oyMbctFuR/1WHi/pPtFa
	wMFLLZYMaafC/Ak2NmzH0rovpqsgOCOBX77X1aWtvKzlrF3w3/IdEh10gfvGX4MNHsLkEgO8V01mC
	nk8E1upe7gtADnmFwqiIndCTRykS2/5iWp5u8pakugpFF15y35xJ2wla7CjJ3YHrsDYGypyeljMqo
	EAYcaqzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3mNq-0000000GOev-3tw6;
	Thu, 24 Oct 2024 01:11:26 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3mMJ-0000000GOYa-1YCF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 01:09:52 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso342543e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 18:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729732189; x=1730336989; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbcd5uRapQhQxq5MJJTWR2sL5XsG0N0yna5jn5lare0=;
        b=LG9Sn+XKt8s2mkYh7P91Oi6qHqUjMNhGdj3/DTT94qFqUkg7rp1QRGKyZYKhLKPjVF
         JXsHqG4j2R2u5iC7wd8Rs6C7baqmvy6ZWqPmmbjcOlQPJTgmRUZtxCSfUZ9lK+bgGYqg
         8+kjFjpBzPS4Ml/EY7AGCjqFT49CkK27W1PqBQflfQUYdCjR1wGVfLj97m/NMulpJg0B
         qPSXy8FuO+PPV0/T3VMxdy03hMsDVyN/i95TySj7VCcpqISEATJ56JkBMnYLEboND+KU
         XxaciiPRdkFGG92BDnR1XCwCbvXgyf84doHOiZzC4wlfHYabN/b6n6vGU/bnN5yHEHyA
         79Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729732189; x=1730336989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbcd5uRapQhQxq5MJJTWR2sL5XsG0N0yna5jn5lare0=;
        b=fKuQ6H0g9IgWUbeETu6tWEpO03yJADSqBs5ostO/+gE7OkkCURVgm5LGgGynr1Rprg
         UZWmHtDdaKNGAbGBZ1R4NJCRwv1/mF8zJidlnY1ebK4Mb6ztikTvnV4FPPubSmnRm/rV
         eF5bVWDTi16djdgj6MOtsw24D/pbF/A9SAjrzmHB+ldKGm0a8VO7MapWJMf4vLRSaclq
         5lc3TTFg4pMxBDE3Dbe9HhwCHu8Yd8UpFvoJ5TyPRw++SOKW21jTQEpZezxaJOEn27Ja
         ymcoUT9fwT8+vYLYCK5JRqn61wmEPp8sR0rr3c1i6dVazM3ZnLUN8P674pBF1GKXNoU7
         mLDA==
X-Forwarded-Encrypted: i=1; AJvYcCXfC5Pvaw/UYISXsGnuTrgRL/08MlwRmn7lREAbhSSMqduiqY9tY9VtUHjkxRZwfjeERRtqVVW+LIsQ3tQ6VoAY@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv+DdnI4ppFVs/8XCsbbn5MUiV7BvzwHx6jG3fjyqVl2pwf+o1
	B7ev15uME8h2lQ8Uq8wYxgfyrgQfmhL7oz3UbdLceDGwYWGwFMRNAK2lygEAMztBPC4amMnoStW
	hp1wIsZHrFrrQAW6XJpCWmrxe10Q=
X-Google-Smtp-Source: AGHT+IF2Ax60z242ilbI2EuA61CSMux8GznaUwVN4gBzSDilDhsogRyUKPdE6YgVBW9AvJpAlEtab7CwKd3munRiSXs=
X-Received: by 2002:a05:6512:23a9:b0:539:e6fc:4170 with SMTP id
 2adb3069b0e04-53b1a33ca83mr2476739e87.32.1729732189049; Wed, 23 Oct 2024
 18:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20241023-imx-ele-ocotp-fixes-v1-0-4adc00ce288f@pengutronix.de>
In-Reply-To: <20241023-imx-ele-ocotp-fixes-v1-0-4adc00ce288f@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 23 Oct 2024 22:09:37 -0300
Message-ID: <CAOMZO5Ar0Pa6RpjmXkX4cd4oao3ggbs4a+OsSp==PGO1CV_-RQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] nvmem: imx-ocotp-ele: fix reading from ELE OCOTP
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_180951_428910_DF91F09C 
X-CRM114-Status: GOOD (  14.67  )
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

Hi Sascha,

On Wed, Oct 23, 2024 at 5:12=E2=80=AFAM Sascha Hauer <s.hauer@pengutronix.d=
e> wrote:
>
> Commits b2ab0edaf484 ("arm64: dts: imx93: add nvmem property for fec1")
> and 0d4fbaffbdca ("arm64: dts: imx93: add nvmem property for eqos")
> introduced NVMEM cell bindings for reading MAC addresses from the ELE
> OCOTP. This doesn't work as expected due to bugs in the driver:
>
> - imx_ocotp_reg_read() interprets the incoming offset as 32bit word
>   offset, but it really is in bytes which means the driver reads bogus
>   values whenever the offset is non zero
> - imx_ocotp_reg_read() reads wrong results when the offset is not 32bit
>   word aligned
> - MAC addresses are stored in reverse byte order in the ELE OCOTP, we
>   have to swap the order before passing them to the upper layer
>
> This likely went through unnoticed because the bootloader normally adds
> the MAC addresses to the ethernet nodes and in this case they are
> preferred over the NVMEM addresses.
>
> This series fixes these issues.

Patches 2, 3, and 4 should have a Fixes tag and Cc: stable.

Thanks

