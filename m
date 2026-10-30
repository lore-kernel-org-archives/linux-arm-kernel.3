Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1EB606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wHFkONup;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=A0gP2Okt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kpTyrdA1i+y2556zUDjgson9wJKQHizmCV0pLv7Ag1Y=; b=wHFkONupU3b6fH6Y0hHn+Na7ca
	qSwZuJKOLbxUaGVvgxKO8YcOw1j0/I/mxR6M0jqwv9mBg8Z3D+r5pddbOycSvwFhTvAvURhEhS7IH
	nTsYp5zYSUVR44G1b9oNfjlojpBt23eEtQJxdxlcC+mCnS+KGTeMMKdiIlTnHRmNMr1OE/k0uowmE
	R5YeXoP4yuAsf7bRemNN2e51VtsmYs+vMJlsq592GqYBK2XHJeegsSa4u1iFUe9XcBSbSFVtNMWiZ
	xDjHEFFOhe0lF5UGZ4TLYI8XZf9SzbORNVFXsh4J2uOiWjJ60WMJ4LRmkPJmW6w5zCpVylgY/HNPp
	YcGmXsSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjkv-0000000BNgt-2yUu;
	Fri, 30 Oct 2026 10:22:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjks-0000000BNg2-2nAe;
	Fri, 30 Oct 2026 10:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=kpTyrdA1i+y2556zUDjgson9wJKQHizmCV0pLv7Ag1Y=; b=A0gP2OktV3j0APACgbuDn/vfC2
	R3sA4Q36DZns9JdO1IT+O/9UkkNOBE62zjXIXx0UtsF9ctWF8OPUNfvIMifVFoGTOADx349TDwvTe
	MX+NdE5/T6osdEP7XHBhhDjyMU7vbQdcPF2ZzgjP82jvOuUAMwRDGddyf4Buf2KdKP2vvDOrtoYeP
	eiAnQHDiYnipbpt7KT/Su4XXhRawNLJbikqhYiRcj5/LTB+9wC+XWw+RUzACeWmbBAoyP2WxkmKk+
	6aZoSEfjFokA1E/1yUMhUH9n/wRtkCuagTsCw7gBbRnSJcYMH36v8/8WobtK4mmoREtsnY3KlJQMA
	utG7TZsA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: =?UTF-8?B?WWFsw6fEsW4=?= Can <ylcncn@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH] ARM: rockchip: rk3066: set soc_remap before starting secondary
 cores
Date: Fri, 30 Oct 2026 11:22:32 +0100
Message-ID: <1940718.QZUTf85G27@diego>
In-Reply-To: <20261030073647.164416-1-ylcncn@gmail.com>
References: <20261030073647.164416-1-ylcncn@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_032238_762065_97BDFFBC 
X-CRM114-Status: GOOD (  17.82  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Am Freitag, 30. Oktober 2026, 08:36:47 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Yal=C3=A7=C4=B1n Can:
> A Cortex-A9 core on the rk3066 starts at address 0 when it is powered up.
> The SMP code copies a trampoline to the start of the internal sram and
> relies on GRF_SOC_CON0 soc_remap (bit 12) mapping the sram at address 0.
> The vendor loader sets that bit before starting the kernel, but a boot
> loader started directly by the bootrom leaves it cleared. The core then
> runs the bootrom instead, which parks it and also writes into the start of
> the sram, so the trampoline's target word is overwritten as well, and the
> boot logs "CPU1: failed to come online".
>=20
> Set soc_remap after the secondary cores have been powered down and before
> the trampoline is copied. The rk3188 shares these smp operations; its grf
> has a different compatible and is left alone.
>=20
> Tested on an RK3066a board (MK808B) with U-Boot started from the NAND ID
> blocks by the bootrom: before, CPU1 never came online (GRF_SOC_CON0 bit 12
> clear, sram+4 read 0x00000001 instead of the physical address of
> secondary_startup); with this patch both cores come up at boot, three
> offline/online cycles of cpu1 work, and the board restarts normally after
> a reboot and after a forced panic. Booting through the vendor loader, whi=
ch
> already sets the bit, is unchanged. Not tested on rk3188.
>=20
> Fixes: a7a2b3118b41 ("ARM: rockchip: add smp bringup code")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yal=C3=A7=C4=B1n Can <ylcncn@gmail.com>

there is another patch from Johan pending [0], which I plan to apply after
the merge-window, that moves all of the A9 cores over to booting via
the SoCs bootrom and gets rid of the whole trampoline code.


Heiko


[0] https://lore.kernel.org/linux-rockchip/20261017-cpu-v3-1-25d8f4b06362@g=
mail.com/



