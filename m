Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BB8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 10:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jfp9SmUDH518VNnaMu3qm3fIwFvpgmQiefan0yTgrM=; b=UrHQtlyU8fdJDGGQL++SDuO812
	xyvRota2Vbv0PRX9YX8KQWWHAd6U8eprQmeY6USmi4HfizK54FKUeNEm+AyLZUYPf8iH+LdOjp6OU
	r3vJdyHUtr10ZpJyEwqV/z1eEWlyLGuOsZ5u14bJg7Hb57ONbSFpjyp4J/Gm4ltfpAlAorM0oGcBV
	ijQLvFDwigD/r6CFQzUYJ1iO//cvtb+zrn6pCGtBRlLiCDRrIBm3vLv6P2QbVbpfDbQa2TpxZcALr
	CfWbyXHmTEbTCmMzFqGnlvxwZTgMyn2QsrSaGGdS+lYa9ekR/qbd0LhU3KckevEvJmT6CDVmctVa0
	RG/Y/Rhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCbm-00000004zsR-0pft;
	Mon, 30 Dec 2024 10:02:46 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCZS-00000004zWi-05LU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 10:00:23 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3863c36a731so6920003f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 02:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735552820; x=1736157620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jfp9SmUDH518VNnaMu3qm3fIwFvpgmQiefan0yTgrM=;
        b=Ucjus2psg8RzMRUUXUyAOL4IobLBwV1WEQo9KwJHHl/bjZ25UvElP/v7GXsBUbOEYL
         +PUSrNCSedsqp8QgcBFjQMb8Pdi2z4msceQXqlTIb4x1uAMEbmBM5S40g3+GNqC+tVyA
         AZxF+sMWvLKHeBmPgp4Gn/t87PtUa4wsPlQQTRqS6khR9EgG75VUORTaO4AKLyTFzTPZ
         LvSYs2lAoAEusIIeHe0T1dDdzRK/Rca7KDjPwGFhQd7cWZrnFkOjzVmmCSVxqf+YbKx7
         V3YPg6nPJQozekBz7znig+TBl1SnB5CJe1f2AARhDphLPWrk83qShqGRgEQj9o8jhkkW
         uh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735552820; x=1736157620;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jfp9SmUDH518VNnaMu3qm3fIwFvpgmQiefan0yTgrM=;
        b=G85guNat1mVeEKsBZjnGq8Wjwib8j60OZBpHKEK+2j79fQgR8JMUQDnh5sfAhB7qsq
         bqsZwIF9fN97llsQBMNWMMEv/DdSn7CKT3ZyPZYkSJuNrLSkNzO1A5pEMQiFjSaGXCmq
         r+vlVERh9AbYxmbn1q9oTVY9iV+GnPFMkj/eO4v2R4/WMxd1Sei6s0Vh476bUd+eMQHO
         2vxgtY92DIgwxRLmfBsNlT4RDJoUpuKWsosAOoy6TvjJF5E1Xrz9jy1Wvr94sRxu6bNz
         gEORIboSOI3hDfIwU3xGEaMHkf9GkSRk+kEgsgi/aZHK8a5H9510Rlzi9WlJCD31JXAM
         vTCg==
X-Gm-Message-State: AOJu0YzPDEfaVBYPJrYtD1VzwVj0w10QJR1Do/LpoTZ8Vn+C5shYlr9H
	hr2V5AbpCWrLaJL1DqGOBxzg+/rCVHvKad8/iYtk2uk7XUNAZTT5OwGXXFlbdxmek/CY5nS/m5P
	i
X-Gm-Gg: ASbGncsdeZh5kRfYlV1m9+nG/siw6/I5WNgWWgrSFWQ8C/lzzmyYQuD/nbVVn+9qXhS
	Jn22rqomSVqk9f9EwzNPSs9tCyYWJQWSCSDNkC5Vq3f8wguTp2QtKygYVACMWYHOpnNToCHbsBA
	oHBuR1zWdljUCIx57pReqxuxqLlWwJ0iWJcX4dOLUnseLTV2P/2Jfifk/SnMYWhwS1ck/mtNgy7
	lY6tNzNEr25swbmg9KpE0COZ6XiLkEHOn6DhWMFTQPw1/5jy/Tor6K5bPx5t1w8sSQj0LVWiEc0
	+Q==
X-Google-Smtp-Source: AGHT+IEuGi6MCYipXIk5Q5oobmNxWaU1dKW0QbR9Td99CaPeqsk/klM4UWZLTAwld9MSa5fELHIXHw==
X-Received: by 2002:a5d:5e09:0:b0:37c:d23f:e464 with SMTP id ffacd0b85a97d-38a223f75bdmr31618551f8f.38.1735552820388;
        Mon, 30 Dec 2024 02:00:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4365c08afcbsm360576575e9.21.2024.12.30.02.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 02:00:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20241226220352.965505-1-martin.blumenstingl@googlemail.com>
References: <20241226220352.965505-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] ARM: dts: amlogic: meson: remove size and address
 cells from USB nodes
Message-Id: <173555281977.2076800.1598444993782802807.b4-ty@linaro.org>
Date: Mon, 30 Dec 2024 11:00:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_020022_055339_20E00B4D 
X-CRM114-Status: GOOD (  12.06  )
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

On Thu, 26 Dec 2024 23:03:52 +0100, Martin Blumenstingl wrote:
> The only board that actually requires these properties is
> meson8b-odroidc1.dts but that already sets it on it's own. Drop these
> properties from meson.dtsi because otherwise they can cause dtc
> warnings:
>   /soc/usb@c9040000: unnecessary #address-cells/#size-cells without
>   "ranges", "dma-ranges" or child "reg" property
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.14/arm-dt)

[1/1] ARM: dts: amlogic: meson: remove size and address cells from USB nodes
      https://git.kernel.org/amlogic/c/3a4bb81850662bebab74f1ad27071652b1825d58

These changes has been applied on the intermediate git tree [1].

The v6.14/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


