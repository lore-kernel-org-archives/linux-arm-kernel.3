Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD11CCF2D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TKRnJ+VtMZF6TaWgWCKUw95h9bhw7Ve7U+aGgjkJdw=; b=za0PG8j/cUrev61Q+33bSHGsPu
	wk9gLpmHd6jTeUEn3zlQW/IwnULb7NP2C+k25A3sz86ATz6kfk1MdxywuxYaRZeh5ZdkOq8g8FBtR
	uVMmWkQJW13LE+ID8w0x/YTeX4NU604F3I1YJawcgrrfo5aCmIvqPY8nRgwCCs6dAFw1cpfmoFU/V
	h8XhVK0SCQnzF6nTDZ+W6DuQITlKz2DRP15gRuTEAZ0LwWaIrpDHo1RTbPEnLUXp4duUkPiQkuuHn
	aShZbygexWBdbNarJuuQa1JLuSBLYBODO4thWVPa3I0PF8pvZW3boR+3+DWk2KEXYzFsc5y66mMbg
	iaBMPmlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmHn-00000001jYY-06vk;
	Mon, 19 Jan 2026 10:15:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmHh-00000001jWT-2HL4
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 10:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/TKRnJ+VtMZF6TaWgWCKUw95h9bhw7Ve7U+aGgjkJdw=; b=D7Yp1LDZgqElmC/n5DscjpCG3C
	dHpa2kODaRWvpJMQcvymZ2gc6n3mAOTWH4nxrvmsAq1Ri2Xa2/shYEqYUOk28ztzTCvj8+RkaPJ1E
	6BgeF+pjxgPQ2PStD+wJ3n/LliGKrjASEtVeP08Zc3UVmaevpBAIyvUok0eYGqWuDmKPXGk5fdTeB
	21ZFUnWQWo/BVBYZb+ZjUlGRloLNAJ1gi7dWzDz7NnDBLHE2b62PXfPg8BuwIdU2CiL+zFBdUC2da
	N7yf7cfJEZVzpv9UdUBeOdTCUpkO6ssQx+3ZDtLcYbtyG2FFpYmGyaNqZpj6Potdhn3414OOo3KIe
	SZVNiS8g==;
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmHe-0000000Bpfu-3Wx4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:14:56 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2b6bfb0004aso5330173eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 02:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768817692; x=1769422492; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TKRnJ+VtMZF6TaWgWCKUw95h9bhw7Ve7U+aGgjkJdw=;
        b=ZkJAfOqKTH7icPGBY7nP29tuHqNHmWaPIpGRhhyt1uO26riL+/wNlczG2ZjSNJ0swb
         RHiG0OZg7sSk5B1XyGMATyCn7Igxr5QME6st1Is7otZEyHAktKhJuDHKGk5CgFxn0Gfg
         VbGkDEPVi7gWPRAeG3GP0wDmCzlwTVa2wAsRlneAseToMgqpIFQRkl/UuaAR2NdDRfoV
         mo9BtISNJ+qIp0KWP0gVoRH03CuV54AyxlxgZLZf+arixCzT/BKtV5aixgJFtTT64orI
         hnTY5VrhkZB22cDlrVtCGdS1DLbjtWaH7rl8ifGV+LGBCC/Lgk1TnZ2/KNAiv7ObLyaE
         BGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817692; x=1769422492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/TKRnJ+VtMZF6TaWgWCKUw95h9bhw7Ve7U+aGgjkJdw=;
        b=EInzT4tgkmsdfJtywnXbQzdmaqhiLKoa0joTMmrjly6LGobr2DZqeXUuqbrAyHzbZ2
         HYtGv1zyS4u74UGGfUYxs0q8thO40WiX/qknE8JPDjer+3K031BThfJQ1LEqJp6cGoW1
         41x90X5G/F+Ouoeut/D03LcqYkfhcTNYug+G4TqWdAfX/K7/q+4CgmBc49lIpB6sKsAr
         Cg9mDBU7Bniw/ttM+VrOBcEr1/6mBqZWr46Kb7cGoXAv/xkrhRCzj1x9o3bhz3GCKjdy
         WMFy6GpipPJZfJr9byrevCQr2IRoRnx3FCyjoLqjvUt/1hweYHDDA23DzPSGsOGKBsto
         RK7A==
X-Forwarded-Encrypted: i=1; AJvYcCV+08X/hLvsdI1weYdiSpCnsW5yK/QpuZtlvsrEU6zHr4frtVEK8BQXYjulNSRp6s97+U03UUe5DlWCP9ZFYMpp@lists.infradead.org
X-Gm-Message-State: AOJu0YwlOgmXKw3l6HyGNyvQBgff/XqKEzY55Cwabe2wrViJAjA4YQWn
	i/NdhxLOxCxPuDHv3DuIgbB5nETWpgcm2zW/LNVR5ou0psatcvChk7El3Ho91FPQjGCmyGbozMR
	tL1/V0zPpUt1B1SvdbNKx26ttNVZh2y4=
X-Gm-Gg: AY/fxX4Hx4sJi3+0Et+g0mQPB4Gw+Y4UJipka18g69QFx8d2sreqq4mlwFLWjxcOKo1
	yQ73UkHdEbhgMmm+4yfgavpVokzO+IyNxMqOAnoqm3UkH/kzFwZ9VgE9f4+O2zk+ciGZMS5Ty/y
	5eABa5og+M87ZqetjZk5X4ACNDt8k7yL2hc7Xy5AYEJ1JFRXp5UUP+GiR+/JWwOJqGtovUk16Vn
	EmQL9EunjvPAxeZFhAN3cYkBwW2TTHenFdkTeqU1FhYm+vDhIjrowxr/VqvWnombXuu9JYGLARs
	v8egEpFS2KluZxx/If6lvt0/7LiiCl9v//AYhG9SfJSV3Bv65PyPM6wDiNy9BWNUtCKgLRU1ae6
	vYDWEh/yBAA==
X-Received: by 2002:a05:7022:48f:b0:11b:9386:a3cb with SMTP id
 a92af1059eb24-1244a77e0a4mr10011720c88.44.1768817692373; Mon, 19 Jan 2026
 02:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com> <20260119095511.3030739-2-zhipeng.wang_1@nxp.com>
In-Reply-To: <20260119095511.3030739-2-zhipeng.wang_1@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 19 Jan 2026 12:17:31 +0200
X-Gm-Features: AZwV_QhxRo6F5HrkZuvbzdlVN1eKqrMGyjLqsb6FzOBXX-W-zaQ2c6zE6aIsaxU
Message-ID: <CAEnQRZAtLYG=ddDSfF3LMOtpGWYAU4Y=UJKAyi7NH-sZyLubMA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] clocksource/drivers/mmio: Export clocksource_mmio_init()
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: daniel.lezcano@linaro.org, tglx@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	chun-hung.wu@mediatek.com, walter.chang@mediatek.com, jstultz@google.com, 
	amergnat@baylibre.com, aisheng.dong@nxp.com, jindong.yue@nxp.com, 
	xuegang.liu@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_101454_926398_98CF81B5 
X-CRM114-Status: UNSURE (   8.59  )
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

On Mon, Jan 19, 2026 at 11:59=E2=80=AFAM Zhipeng Wang <zhipeng.wang_1@nxp.c=
om> wrote:
>
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>
> Export clocksource_mmio_init() and clocksource_mmio_readl_up()
> to support building clocksource driver as module,
> such as timer-mediatek.c.
>
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> Signed-off-by: Walter Chang <walter.chang@mediatek.com>
> Acked-by: John Stultz <jstultz@google.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

