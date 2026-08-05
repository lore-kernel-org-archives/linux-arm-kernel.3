Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AFBC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 16:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0lx5fgW992e5Cz/cU4YqatMbomgvYAN8oH/xxnURBY=; b=H9B+BiIm4E7Gavd7moOpDWE+g5
	a0t/6qcNvtrJmca4zCyekNgSuYti5zU2+Rl2I1e2tnFFiy16iWlV5eE1HFKzmL9vL6dQI+mj+LWmi
	tFUBclYQK+fqk1KVBePex5D80vg0qSlURskhLWKcOu4RXFXymS2mCuQhCTlKakhK+l0hOqdbjh03W
	8Iy5QMA0G1Rp+UMp8FHfrjabwTI8Hhyid/tZOcZ/gFZ86hm3LxiOEWAD1ON7JhiW8KI32PiEKlbnW
	/3VC1ZGuSyYhEKRyCMXLLIB63IwViOhLNj9d3yYqSwWS4vDdZicBzmbJQ5b6pTDw2rGhM/GR5g7iT
	LQiCXskA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wresj-00000004IZV-2zQW;
	Wed, 05 Aug 2026 16:54:17 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wresh-00000004IYw-33H5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 16:54:16 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47fe76491b8so91467f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 09:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785948854; x=1786553654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0lx5fgW992e5Cz/cU4YqatMbomgvYAN8oH/xxnURBY=;
        b=s4V5bxzNDyDIW63n+dfj5m6G0SbFlEbkoM9TXqgW1BWpJH3LW+Fnqatv5bmZZaljFO
         z4zpbAMgbpUBXIT4PI+bHaQUcuuFkomQnYe0YHS0R662YQgYuETjgEcB0KqfO/KS8Hna
         ruUF9oNW92dxHQgAyToOGtUaoKvTbGWcFtiZes8UV7QkHklm6ZYIsmJeBwQ1OzMgOhTQ
         tKHJuq82dEhEw8EP07atawVu+ncgvBgjzsq92BS96TvLU8wEO0o4j1h0do3P1XMfop0L
         pNjkicynefzbV8lFrsV6WGpWwIt9An4oeh0ZYOn3+lHBT/wZ8As0+ZUCRD4dMmOLhVSa
         XStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785948854; x=1786553654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0lx5fgW992e5Cz/cU4YqatMbomgvYAN8oH/xxnURBY=;
        b=Tz/sI/BcIbut6sVCXxJCqhdFtB9CQB5UcmAyNT7VD7ZUibOetnJUlb6zDpKk8MBJOk
         ojX5eptY1Hdzlfat6VsglB/zbjDV2rtwWydhOWyu9HRR+sgpCSeS+0hs5I3rxNsVvmo9
         olg4sFDfucqOBm9ARU2RdMQvjzB6rRZC8p0iPFoGZTtwmEWD+o4Hl2HDrhvWXktB4cMl
         4Pmg+tfk6g9xUZlWqkxuPepD3zsXWVBtg2gU3bU2FNHw8pA6E5y+UmTT53EDHXkdhuN+
         it0O+HD7nBGH1c1FDAEg90E9uj+RMOMGmIDUBRy4hrUVO3+atJAlo4etVMC6zZ4C6s64
         +sLg==
X-Forwarded-Encrypted: i=1; AHgh+RrQIOKDVv+R9c4EPRjhAgb5IH7H6/kzLDlhHlgdAoavL8HwLHmDRROJFvz0ZmD9tvCjU/euI/utNRctpHgZXwa/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx78fVPJzVKsJ9KqdSheY5b4zaRrGM468cTkmOkq3YmpkzpdUZl
	NZ3GMYU/Ys0KAJqMpKu7lTs5152iAMMd0PpFpUd/V7dS/8iNJUchcuDi
X-Gm-Gg: AR+sD10m3KnKO/8sr2xDq2D+NWSyoOXrann01+eqjq4Ml10k8IsFijjzZz8jwDqSNyN
	EDlKff02eTtaQIf/kTb0ZpsBzskmTXOh8GGZEnbzt7p2wbJvgF25dDQuLF+05c+pPU7YxY5b3qt
	v6tmxwenlNEwZ/VSDVAy1OuMX3KPkB1VDnW4Z6Rdtz8p1Lz6cG+5xyEYqlwRTOjxhILvgreijz4
	AjafEDctvJXCZO6j9QRDTdRhif2Re9u6mnqL/UTxqze4JBWi19d7WLt42Tgh+hqS3jt+EUHsJxA
	iHyjVamRVQrIZ4d+yxLnhcgXVs4BNztjJdc4TREy8DrT+KozLVG3w7YLJBMRih45CjmXVZoRP2+
	qODbHrJGc7sUSP+4XO2MN6UDyrnPp3wCycgx31xEzqTT6PebmPpomkTOHAoX1YdRkGdXTq6gAkA
	JrlYMsHIDNEO2GXr89TACxZGh0ciIR0U/Z9o5rICDNAMrfIAIFt/hrbSR1dF7OHCbSmP+5FIbuF
	HPJRGXY1zbVi8+MxgAOh9zsV+5DJp0q+lApErDUxrjncp1PFMwtOHwYrIRHyyMrqdJonlc2iiNV
	n5k=
X-Received: by 2002:a05:6000:200f:b0:46f:7d90:8124 with SMTP id ffacd0b85a97d-47fec528a60mr6555260f8f.2.1785948853795;
        Wed, 05 Aug 2026 09:54:13 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B86F10001BE789C6EE938EE.dsl.pool.telekom.hu. [2001:4c4e:1b86:f100:1be:789c:6ee9:38ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febfda0d7sm9829057f8f.2.2026.08.05.09.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 09:54:13 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniele Briguglio <hello@superkali.me>
Cc: Ricardo Pardini <ricardo@pardini.net>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH] clk: rockchip: rk3588: don't disable unused I2S MCLK output gates
Date: Wed,  5 Aug 2026 18:53:47 +0200
Message-ID: <20260805165350.14710-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6cc68287-ee87-4db6-8f40-531ec2d92fb2@pardini.net>
References: <6cc68287-ee87-4db6-8f40-531ec2d92fb2@pardini.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_095415_783140_AE488A2B 
X-CRM114-Status: UNSURE (   9.77  )
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

Independent reproduction and a Tested-by for this fix, on a third board
family: Orange Pi 5 Plus (rk3588, es8388 clocked from I2S0_8CH_MCLKOUT).

On v7.2-rc6 without this patch the analog codec is completely dead in
both directions - playback silent, capture records exact digital zeroes -
because clk_disable_unused() closes the new i2s0_8ch_mclkout_to_io GRF
gate at the end of boot: SYS_GRF SOC_CON6 reads 0x7c7 (bit 0 set) while
the clock tree shows i2s0_8ch_mclkout enabled for the codec and
i2s0_8ch_mclkout_to_io with an enable count of 0. Re-opening the gate by
hand over /dev/mem brings the codec back the same second, and with the
gate held open the board plays and records normally.

Tested-by: Igor Paunovic <royalnet026@gmail.com>

On scale: grepping v7.2-rc6, every rk3588 board DTS that clocks its
codec from an I2S MCLKOUT still references the plain id rather than the
_TO_IO one - I count 21 files (es8316/es8388/es8323/rt5616/nau8822
across the Orange Pi 5 family, ROCK 5A/5B/5B+/5T/5C/ITX, NanoPC-T6,
CM3588, ArmSoM, CoolPi, the EVBs, QuartzPro64, Gameforce Ace and
Firefly) - so all of these ship with broken analog audio if v7.2 goes
final without this fix. Is anything still blocking it from going in
with the next -rc?

Thanks,
Igor

