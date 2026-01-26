Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961ABD19502
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 18:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9sW7exYhXYo5b3X/iX8Xd4kSUfKtlhUjch+6299QS8=; b=UMQr1f0lqlFcAJTjdxd3l37beq
	q7UITyQPdWgQ5jO/+BzRjIIhdkrMUwSORW3MHb9IiwD+HK+tYnBSTK7abLcJQgFjPcVs3WfklLiKU
	5DRtQxvwPvHOacDzEIc0IKEKF64+h6oVkH3qtmv4nAKOBB2sykQLQXK38mO5NwUYvJmKedgJPFOba
	65KXHkdCWYvtUzqGpgYxlp2Lx0HcrH/HSuegYlGoA4ZhqvtrSNk/SMiHWTkDn0xswDL1/7baBdQEZ
	TKvs3c4swV/Z+eIqv2OwkZJWHOc4s2uzT0s5pDpG/xnIFKl9IeoaMbePrS/WF9vK8xVPNRyVX9fRW
	FboaWw7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQxu-0000000D22V-2wkX;
	Mon, 26 Jan 2026 18:05:30 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQxs-0000000D226-1hxP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 18:05:29 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-5014acad6f2so12011cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 10:05:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769450727; cv=none;
        d=google.com; s=arc-20240605;
        b=FUtEnkEOEeiAADXq7uSyFc8yFfyS/uGPGWfMPR7MS6ABahxpNOIK5o4eHVT/Kp32K7
         ZzuCR3vIQ0XWD7IqrUTYvdrz1t5sTuMLdk/BNrPlCmbtF/cKBb16VkDu5ilKzFtDLJTK
         U5jx4QRSqM6xhmjtxiY6nFXeEYE/IxZwgiQbPtFv1OVroNBeeus3WLKYyX7M1jll1JFv
         gxAZS/guw6wMSbPDE1zVyoDh5nhhgTwXxtHOIPNfABA74uUJhwvTiDdQBRMWs/IJxoxX
         nPWlhfhLrbJsXrJUIi2ITEe+PHOWyxV7E+WggZietLsZ47nqDYiPoMvoST0tjfbwxkKU
         dqYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k9sW7exYhXYo5b3X/iX8Xd4kSUfKtlhUjch+6299QS8=;
        fh=fh1AzVjYNmP837qpBWRuh1FzwqJkxq49SH3E0Tm5jx8=;
        b=gh8h+vyPa1f25w3MtGzUDdnXu8oBmFdRfnFuPfwZ8o8TnbBavq6P0/SDqBPZMWo6Kk
         gwcFbh1JKGz9mGb2v3RKFQlQebcpka72fmUwwetlSBRsGqvPOAWPvajSSpZSzwLyZ2h6
         relNbhhZktzKACUK1Wz7UYhS/8KaFDH+iyjqy5y/u/5KGk1Z4PTDJyEjTmlrsjtuBRxa
         1tIiNsUihxNhVbs7y/YS1rGauiLJ11h4uBasWrN02B1FMc0jBAWd3hf/8NnrEcxhyfih
         bZyd1S4YIArcwl+C0D3s1TKzZAyVRI6ZS2LD89IU7j5pBMeOvoq+fgm3KGsI5mGfpwDz
         NKgQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769450727; x=1770055527; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k9sW7exYhXYo5b3X/iX8Xd4kSUfKtlhUjch+6299QS8=;
        b=v/xa538fW+ZfPHVgC6uHfcNixRLR1J8nzBxHnmXKg3cEaZKz5HAdCg6tY4zNYhuLJU
         4gYe+6BAEfsF4L/VazN1/Y3BItL8bbmesCo3zK+6N9xb8yO4qyagiYa/XZ2DgrT/tui1
         WWXo/Py2fJbMNfLr34praHqjUX+cWL+SJv3yyAXpryfYE14nOpEvl7i3CYLH1Uq62myI
         7ufgU+D6NMk20MjvXYzY5+OW2Iq0x85jWN+EsMDjkntXywaOV5Y19m9YkCzbuTSxmgg5
         jibIzQHHP3pYeQGr+JJimqqZ19+VZKWMab0y5Xt09MYl6PyfDnuzf82iiW6mvpP1afh5
         m5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450727; x=1770055527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9sW7exYhXYo5b3X/iX8Xd4kSUfKtlhUjch+6299QS8=;
        b=ImV33ju4IrRYGNCUeclzS8y7lHLwVS6NF8Z88pGgQoOIW1zbfvfidG+wvVhIRJwucF
         fMMJ0bxxmCHI5FqIeEu1G93qAl46PSSTUHMNvleuFFC9i+9ftXI3JIWZSlOoC+KZBUrS
         CUOfE2yJsiAutjwhIsljDSRv/j4LLlc7zO+7HsODOCf7pPq138R0wj4JzY/pUKkvPN6l
         gfbqyYkPRLh6Jo7kb4vgtdpMY27Ulf6VyhSprvnGBlAhRtQo6M0NImrR2GsjKAH1+UoP
         zP/nv4bkCqdET+wKnLafqZ4lVnH9BBgpeA/OmfaZv4PGl7ypGZJfxJ2Jl69G8/56edKc
         ooHA==
X-Forwarded-Encrypted: i=1; AJvYcCWELtwcdkcOxTAZ27s03V6482h5GATewODka3P8IcYpiXzr1yX1y0Vwqohl20rXqpinoVbfX5+JhRN+aHbCQoxE@lists.infradead.org
X-Gm-Message-State: AOJu0YyXF3AI6zUZLMINTCBIiLEOgaXU5LFDHU3T10NAeCMj6cQdzWd+
	6L3WS13LqsZryc6cTYtoo+ybj1OMJPxHaXSPTsgQU825gu7PLUzLwEQG3UiLEjpvAIMmvdrn8c+
	fFlB9KyytZS8w2sNpalAhMV6SrJbbH1W/dM9bL6RDvgc2cijQHsNXcfz0
X-Gm-Gg: AZuq6aIeH3fkhSCzVYqWWb2LSGDAuloyxfa/Ij2xwPvxmMp1s+BSylHvu6GouiAueXH
	0yhqjFIj9VMsFdJBlrLUGtAREBK0sS6i+dol/HRmhkRIp7eJfRFHFGNAstc7CsMY5478nlIlE+c
	p84TJU2Xd0O0i7Lm/HzyLYUMS2CweiiEsaaoKK0iEhsGb+ZsWKgLM19hi90obG3C/Aeru/xrmrn
	qnk5vg9ztP3hnfUoQimpLJHEwi2wAUh3eDfyGWhzkqEfmwW+2ktQk8YlZZn/BgavVp5PTe0e/Fl
	1Y7Kf4w=
X-Received: by 2002:a05:622a:1214:b0:4fb:e3b0:aae6 with SMTP id
 d75a77b69052e-503142cc142mr12796471cf.1.1769450726757; Mon, 26 Jan 2026
 10:05:26 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-3-maz@kernel.org>
In-Reply-To: <20260126121655.1641736-3-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 26 Jan 2026 18:04:00 +0000
X-Gm-Features: AZwV_Qgr9raUBYRUZBfOH_mHnPcBMFzt0yhWhO3RKbwtE7BDMNNTotzOUCwDyNg
Message-ID: <CA+EHjTynFzZK5APC3LRzNbTC8RrtcavBE5=aqwg5a8CCp+oBhw@mail.gmail.com>
Subject: Re: [PATCH 02/20] KVM: arm64: Remove duplicate configuration for SCTLR_EL1.{EE,E0E}
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_100528_456095_0140D029 
X-CRM114-Status: GOOD (  15.50  )
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

On Mon, 26 Jan 2026 at 12:17, Marc Zyngier <maz@kernel.org> wrote:
>
> We already have specific constraints for SCTLR_EL1.{EE,E0E}, and
> making them depend on FEAT_AA64EL1 is just buggy.

Looking at the spec, I see that they depend on FEAT_MixedEnd and
FEAT_MixedEndEL0, not on FEAT_AA64EL1. They are already in the right
place in config.c.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad






>
> Fixes: 6bd4a274b026e ("KVM: arm64: Convert SCTLR_EL1 to config-driven sanitisation")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/config.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 9c04f895d3769..0bcdb39885734 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -1140,8 +1140,6 @@ static const struct reg_bits_to_feat_map sctlr_el1_feat_map[] = {
>                    SCTLR_EL1_TWEDEn,
>                    FEAT_TWED),
>         NEEDS_FEAT(SCTLR_EL1_UCI        |
> -                  SCTLR_EL1_EE         |
> -                  SCTLR_EL1_E0E        |
>                    SCTLR_EL1_WXN        |
>                    SCTLR_EL1_nTWE       |
>                    SCTLR_EL1_nTWI       |
> --
> 2.47.3
>

