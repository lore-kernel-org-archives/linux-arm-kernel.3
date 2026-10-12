Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD10CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 11:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eli0+6uoBuIk4h0bsFH6RRHGJp3/IMgTauKkefW7ffQ=; b=OlkUE1woqYEedLijQ5cAdOVoSN
	daeOl+nWyqqg4nhRuzNC8pfTM5I9NxfKp4qp8rm3IUgjGFDIpd5kOMW3ZxwuuAtyPafTh6Sh2ZuG/
	8T04QieEpI3e4N0ilwZqad9bahMi8bc/csGfxdDMXq2SvseHvohusP/pZBK0yw/Dz/OWHa7yZyS8i
	vtCAzmO/ttNCgv4lNp9qq3IiHBYH4WuZGEw3DqrIaMl1u2LvC0+PGJldpO5RCf6jYVkFNjkPM1hUG
	/r47NtAVXBcj9oJvQUi2RAdsJ0ReNein8E/NLoRWIbDnsm1yqoCCq8p+JiLq/DD5HgwYv2c/g3I58
	dY7PrXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDu3-0000000AJha-3CBo;
	Mon, 12 Oct 2026 11:09:11 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDu1-0000000AJh3-2kLz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 11:09:11 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-8b09e07e149so6615007b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 04:09:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791803348; cv=none;
        d=google.com; s=arc-20260327;
        b=hE1Bgq0xolLK2S1SxTXlyAxDm6dcbFybdUoVc7iTvsTe22Iq2ZSyx9O2z3pkbltvuo
         c3Npe71Hh9YuJWYcnDOtaoC//AYX0YmOEUbKlocQ42z39O4NDvpuwMf+eU4bBIAoAf2J
         6wNpl9aA/yID/laP87GpP5WaBx6t0tgZoquDPSYSyWwT18KdR5gt5VfPrIOwrE+LkiN3
         QPs6OL8Pu+OLIOcakoSqmx0HN2ZS2u9NrOzVfFDIAoATwAVJi8M5HzWP55hDKIhba000
         8/cWXgHfAvFBPBumhOLe3lQ5mqoVZAzSH2Uebd6YZjMMKECNSP/Lb1jg2LSwLe3kePDT
         N7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=eli0+6uoBuIk4h0bsFH6RRHGJp3/IMgTauKkefW7ffQ=;
        fh=r5aZBeUcOqQhXS7vlJctcymX7RQZBcIHOIPjz41u9RU=;
        b=ccqYYHucDhtb7YDu4cWsF+yRY82P11vaSF8MXrLd0Fc0wKppkDYrZ6L8MOmTBDsrNz
         4QvcLWSWzFAGsd1bZLeOeGEjWWXM2Di7SbUUlLeAi5FaVQfzSZFhq15+WM4Uh+i9r7c5
         rZuErTcFrsEZVAAHCIuMfIY5vZBRHflUHbXIscbvXOpiDyo9cOzBtoq6SJGbfr9p77+W
         a94Aq2uFYhR1rKhYFb6MocN/7EleaAeeNQxI/ftKGESYTNlEp9c/G/shbJ+PQjSTNzZ9
         gyATQTOgmDJpCFav0wbVNnDvzi3AiND0A9fx4xsF/ig9f9OBXTCH9nHc9gmYh0gg9gfy
         FJIA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1791803348; x=1792408148; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eli0+6uoBuIk4h0bsFH6RRHGJp3/IMgTauKkefW7ffQ=;
        b=j/LWFpv3BOxIsT/aJhw/1nDHvcxpG2WgH7SxKJEnh1yajSVlMh6P6KOzYT8SMA5o/C
         HjZUNlAC/tJq8C0tMjOwTNHFqnxc2SXeZcFB15gRfx15E14qvZpnD++1KWvj/E/TgIT8
         9yXF4/iWThpaxD1cD/UpF+POkMA85C57GFpSP1zT+V52EUXQyRExaW8WAq1jFoHk2D5B
         YRJqr8aYqOlJwVieS+EgWB3h0dkfXMLsc/P+Ap0jmXpYrOZ+wjGyPYxO26SqfIgbT3O6
         YgpZG+AJcJ952aPW1BNZ3Ceq8uS1+uDT7MzGRIQBqMjtNQvBH+uCTYz/pDBjgZu0tG8G
         TTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791803348; x=1792408148;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eli0+6uoBuIk4h0bsFH6RRHGJp3/IMgTauKkefW7ffQ=;
        b=cA6AL5wJJqCydACSZkxMLFnycGTvKQHPVpyZOpDGp3l2zh8K6gngGyWpQVrCvcjobG
         AkbxKt4e13QdTWpk2yhgUHPMflz8txnntk7aBogNzChE3lV9lAxSIufF7YQx/LuDJt2e
         CXT87I/kzxO6VqSD32vL7up63Fcgj4CPJ94aqfIhoD5RdxZhaeMjfCTCOitPPXwQ+RCN
         F/xgukOAW/QlBseMCTjpKkIiE21u0IF+bYeEw93bpbYiffpWtfoXVZ3zLL95/CyNt1OR
         HHVnp3E+Db1UiKdvyGSf8PjO/G0J+GH/JKVdPOZmTaLgcMw9yhPmI7r2mp7PvY9+G/7g
         6dmA==
X-Forwarded-Encrypted: i=1; AKwUvByJklAyTpeDHQBVaJpOX6iDy+oDZxMMLl91/gFEV0sp+7zkdkVX4ieWil8WzKYtiBi5TfS6IJ2j1/fNkbWsivG/@lists.infradead.org
X-Gm-Message-State: AFq9FYLOySCyFS871stv5z3z6ovcUiQ44MU8hUDJYVxP+Xxr1SFn1A5g
	yhyrXDqQUP1jgsIad0TEHNFsmIcnk2X0t+OpsPQLhi0AHWzHi7MzqbDC8wkDtiFQR9BUeo38U0u
	gjs+z8o83ikHzOQwYd3X+utgX9qfCnws8KzsjPwh2rSHnf5Jg0WRbMiO1iu8=
X-Gm-Gg: AYBFou2tznXhTxZ0KuMSYxhnaVNAstqcC5vZJiV/Kp+zOC8UIRU7J8vJrN6RogoO0FW
	9jW327QxkU2J0YwOFsFuPT6TZm9bkSS06vNWZoNSf5v3oxHE/cpfaxwcRC76B8a7ntzKB1zGqzG
	42PT75gacgHdBbCGBfzm9QtQvpo6CjnmHFPHbesC7wOi1k8i2f73kS0AF7lDYZoBFGpVqwJS1kK
	Ziwju7UrRCSTmoL4rYJRJGuFMJ7ivGWxiLL2ZZ/29a5hG3zWmyRZY+k4Xw+YJ18eQdWJBsZCXa2
	zdXsZn6Ff6Xr0+TyqAN/Gz17A07H9bJwVXGakwKm5EVX2c4o1S8fjob9k6GtiwSNZPBmAaqHt3E
	3Xom5YECHRgIE
X-Received: by 2002:a05:690c:370a:b0:8ac:e42d:336 with SMTP id
 00721157ae682-8b07edb8fabmr25482837b3.76.1791803348051; Mon, 12 Oct 2026
 04:09:08 -0700 (PDT)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Mon, 12 Oct 2026 13:08:55 +0200
X-Gm-Features: AclHuK8i4XW95QdXP2VomS2Z7dIRWbsChmcMmz7GfYRQPqOAo1HawWLt6tev11Y
Message-ID: <CAHTX3dKJ9DKTUHOj+KvUVuePPXF25gmiLeaDJChTko9jV0DmFA@mail.gmail.com>
Subject: [GIT PULL] arm64: AMD/Xilinx DT changes for v7.4
To: SoC Team <soc@kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_040909_699917_10F30330 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

please pull this simple patch to your tree.

Thanks,
Michal

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-7.4

for you to fetch changes up to 7061674069cb2524e7bc58173d4c816ed6529da6:

  ARM: dts: xilinx: Replace spaces indentation with tabs (2026-08-31
09:16:56 +0200)

----------------------------------------------------------------
arm64: Xilinx DT changes for 7.4

zynq:
- Fix DT indentation

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: xilinx: Replace spaces indentation with tabs

 arch/arm/boot/dts/xilinx/zynq-7000.dtsi      | 8 ++++----
 arch/arm/boot/dts/xilinx/zynq-parallella.dts | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

