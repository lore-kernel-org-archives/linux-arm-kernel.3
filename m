Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDC0E83078
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 10:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xejb0j9EkHwaVU0Gjzt6hJh1Gjvft9+wJcQ8Wyd6gvs=; b=wQ+xDcX5/rZpYFZ3Mv+Bh+hgZp
	eqGGMClan0ZCJ/0s4/NEDqFCUyCxyNbpXlCO28oCy09d9NcMkhRQ1MAhYvVClxNG6HcuLgr7fkAjn
	cSJpVI8OSbk1EebCHVyXwvRY0Dw0ay/WXo/dAW6d/2X2HynwGovePKGEHBfhVrHpgpWSBhkr4k9gd
	vd2jrZJF7XhQ1fWYlRZ7+8BbIOWcLn4kh4Frr/1tVMBqFyIO8NeNCUgwSPTPWiw7uTCtwv0Nd/8d/
	CSPy7Cys8lCli0ZKnr+zQ5HwIYGGvm03jGjxRL3wvFEHle4hILfesK5ZY1jGbCFJoenWuAGZVO6ns
	iYB7ojzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDMr-00000006Ryf-3S1D;
	Tue, 03 Feb 2026 10:10:45 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDMo-00000006RyJ-2djh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 10:10:43 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-124a95e592fso7924104c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 02:10:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770113441; cv=none;
        d=google.com; s=arc-20240605;
        b=gQ6Ku3jBSVGe8uorVBdz2ANl6Zv7F56h3H8LubjoosM+DclmvbnRPME0ogAZ6/TIqq
         gzGlw85K+aB2MOXQLp+60EAFkamjQxGfShLTbT25gMdwkItIfYalq6n+cYYd8HokKe/R
         L+oag8tEvO2p4+9qn0osfV5+NuWZZmqA/YDPEeVpNFXxxtmgOukaizifWxpXYeHzSYZr
         90some4WFRJEK1Cnc+zH/4FxGSXrjD6Uz+Rp6fNrpYrb85bE3I9PpWspRV+MCmMdY+Ud
         a95wxaNr+sW1tJ7ACipg/SJSEELb4bskSiy6+A2SLM16q1lpCSN9kHjMuTFP9NsP/9pv
         1Utg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xejb0j9EkHwaVU0Gjzt6hJh1Gjvft9+wJcQ8Wyd6gvs=;
        fh=AByAnwti6FNHFwsEycL0KU4eS2tr2rd3Pw06o3tELGQ=;
        b=gLF1KYpXh3t69ZxO0+hoPAewXRqY1hgFTszkaRucEYpkongn+orS0Y+lDYvmpskcLY
         kkhJoE/WLMxA1mxxEZ9GpEYjWwnSrTnfwck5nUwESo/wKmvMfS+U9ib99i5JSmWmumSD
         HnWZzfL5TfBJM+h3NEqm2X1Z1uucYJQBKg+mNti00fikj+2WAA1t93fwS/n+bVMDDj9E
         zRJTMFWYiLPLqj0OX90gpFlzm+MwllBv9pKRwURiY7GMirsQVY74DOpsLM/JdXUe4Ea7
         ElbHJPlr67Y+RWRtfslDxaNWtLbMGcsDk7C6hzzMod5CqumF0aUtm26oSsWFKGVkxBZj
         fnig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770113441; x=1770718241; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xejb0j9EkHwaVU0Gjzt6hJh1Gjvft9+wJcQ8Wyd6gvs=;
        b=b05uE7+6hU+gQwS4cN2yJDEbekE//U3DKHGpxk4zH4SNOFGDB/1uKuFEyxyR09SR/8
         JV32XOZdBKPAeosGQjzHjQlkv23P1sV3jDxSclwsFVJ8tWriKljGeXoQS5ngKEVMg5tc
         SAeNx0ojuIfF9ghY+ojR8q4bG0a0dP45k1SCEotSNezT29A8Ap6RGbUGqIpUvUj8WGcT
         V469ljR4xTd5+if5lYeTNw4M5QK/AQACWH5CKy+zuTO0wZ+W3+zQRlBw4gSdMGCnRD/Z
         Ctbi4t2XzeGnCvCxHqXP4DEnrhuTyTUvlkaUi61Bt+5G26xvWD6JVQTf8Wu6DEQewAnI
         huIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113441; x=1770718241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xejb0j9EkHwaVU0Gjzt6hJh1Gjvft9+wJcQ8Wyd6gvs=;
        b=ERQhllyy6U6JjUEHcx/9GziemCbL00a/NPI79I5mfI0hI2z/95NGZ1T9xUrccxmYc+
         qGGnG9t1O7PGFX0Ni7BEzn1tct17xOFN257jGZk5q1zk8wpaq4X5y/w0ohJCJ2/07e0r
         iVU4WM/kpoWIF4BT53JjWH/wW1Qt3Neke/2xgzfmgRR8j8pjxNGRxfwv/vySSTL5aKkg
         0y2G5vidoB9w29gV12utiZU7ScqNT+npDK1YCQoKNzxUocBr1h8RlngrhBWqiwhHjcG7
         CeiSDGFr7O60IqyzQOmNBeL4rFzIOfrFrQtTKYGWTC7FfAPDvNrFnSVRQvDeuyeKLDqa
         /x3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDErsk44Qz0GCM9nGV/2P6MCqht2oambWyfFPXT9ND7ydAEeXmk3TB+gala2vCX3DRdaq8GbvmISe9LCsGJfk2@lists.infradead.org
X-Gm-Message-State: AOJu0YxcFm9QvHCh7WUboTq1i3pt2WnaBFsHZcGfr10drgTI7T4prdyz
	fNrDozM4DfBZmmP9oDvznwaevz/Lck/9OEMoEpWKqbZzwccDRNbGpIohuAuFqFDLzE6t5NI3Juz
	dTvVXVZ4SR2VBFkID43saBTd654qSiog=
X-Gm-Gg: AZuq6aLsZNFfvAZ7pskx2M4QjSUFxKpVHMNDR40hMSeGnzEeRpZDcAaiFp8xdt//0Mo
	pl2cSKA04ul/7m837TRna7qfgcFGLWvboEbTdXUM0FekoYX6JSNX7sG9fNAt/drHFd3xybrL+aZ
	M9A7kAnIgZ/CRhEhiEIkXAY6ikoN/qxEfZnsCpcfSGAPMXZWykT7/eh7+YzUzTeAJUblNPwHzwP
	yaRwfqZWubv36KUQW/TgPDvfi4IfCkyxfxNxQjhsgwHukWDd2aefJW7W+S1c7wJMiozB2CGLfMC
	p9NpEYuBqVeu0gzUm+YfMwIKN9ToNmSiFFP7KWx73B3xl2fqrnd4nxzRKdyIQqCd6S3wLjpamff
	DpYordLNTCw==
X-Received: by 2002:a05:7022:6707:b0:11b:9386:a3ce with SMTP id
 a92af1059eb24-125c101ef89mr7226621c88.47.1770113441581; Tue, 03 Feb 2026
 02:10:41 -0800 (PST)
MIME-Version: 1.0
References: <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com> <20260128-ops-parent-enable-fix-v1-1-ff39cc37f98d@collabora.com>
In-Reply-To: <20260128-ops-parent-enable-fix-v1-1-ff39cc37f98d@collabora.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 3 Feb 2026 12:13:22 +0200
X-Gm-Features: AZwV_QioJ69dZ07wlDN2xKHoYGFZyQ3lUnsqEy_ZM2pB4A9WwAjMHzHhAGnPGyA
Message-ID: <CAEnQRZABuXQsJ4-5u9uP8VM63of8EpiV1LcUxv_vSBuGT1uEBA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: Disable CLK_OPS_PARENT_ENABLED parent only after
 CRITICAL check
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_021042_677691_38701308 
X-CRM114-Status: GOOD (  12.92  )
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

On Wed, Jan 28, 2026 at 8:39=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> The call to clk_core_enable_lock done by __clk_core_init after checking
> the clock flags for CLK_IS_CRITICAL enables the parent clock.
>
> In Commit 669917676e93 ("clk: Respect CLK_OPS_PARENT_ENABLE during
> recalc"), the parent gets disabled before this check, if the flag
> CLK_OPS_PARENT_ENABLED is set on the clock. This results in a situation
> where critical clocks have their parent briefly disabled, which kills
> the system.
>
> Fix this by moving the balancing operation to after the CLK_IS_CRITICAL
> check, which should resolve the problem.
>
> Fixes: 669917676e93 ("clk: Respect CLK_OPS_PARENT_ENABLE during recalc")
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/r/036da7ce-6487-4a6e-9b15-97c6d3bcdcec@si=
rena.org.uk/
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Hi Nicolas,

Would you consider please reverting faulty patch above as i.MX8mp is
still broken?

