Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F026CA9ECF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 20:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=326GNDd72hglJsFR0UqrA3uZDZ0kIfBw7vV/pEKINwQ=; b=CbuLfYW+Za8xRPQTOxEBOiYfVN
	b15c3XLFkbK6nyN4EL8P6lKGfOZPN8PdCDby9jhml0kEr4KAOGUePt4V/oSRNLYzFD4GqN1vHlKH3
	c97PvV5Nsi6QSAR0bybjYq0B8EBgCrPqSaIgmW8p2LGBlq3NFQGy2Nob/TvjSZ9jRx2ocF2dYP3Ie
	RNdGxkb6yzV4ZQAhLHR7vYC6HHsLlrTHDmqUEHfwljtEhx9cAb02HcuSzCLBp5E3zwk+BiVP43it7
	RSMQvx1d1FZY9ly9ZjRgitTnvFWDLZhQmO+z3WjZC4kEpGGWT+PgvHpl0+T81WXRiBV8LAUs+BbwB
	wZp9ZiRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFzkS-00000009NUr-3Ab8;
	Sun, 11 Oct 2026 20:02:20 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFzkP-00000009NUS-14k6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 20:02:18 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-7c1916da745so2925573137.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 13:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748935; x=1792353735; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=326GNDd72hglJsFR0UqrA3uZDZ0kIfBw7vV/pEKINwQ=;
        b=Od0XDVBmJIp7nmkUkCM2OTlrFgrUCZWX6WWiUJEOKBOPsaO+9dSQrH3aHZzM11vAr1
         5/ThK3mBRqSMXnn89U1+Z1jKeMNjHG6nLWRhiOapNpt1NwslzTOPfZW2w/VhJa0altF6
         bottRshY+QbvZDTFqLAKMrvypLNhMMAGEndqMIe/wJqrCmYuAxPvZjrtqT0JxWNb5emo
         TFsfX6VlojIQeAz82gpGaIudUO0GdKiLlLmntQ1rxXu8yhwL+hnDtHx6qCNmjvMl9UFP
         EF75ARmUrg/rtNcm9xx8HjfWLGpdRSFSL6ImzR3KvNGXKVDgGyGSaelIOQpZfPi8XX5p
         ymGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748935; x=1792353735;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=326GNDd72hglJsFR0UqrA3uZDZ0kIfBw7vV/pEKINwQ=;
        b=FvbHLPSBVj2R7Um5ZJDi1/UGIywPrrf1DtGqIyg5qRWsKXqEZW/Wf4Uu6ByNCpzvv2
         nN7fNUOR9ayWOJQWXUQaJVA9bkOxpw1iZad+/dqfdI9N8y/GErQv9Wf3YRZm3pjPdTMu
         uMCzPKClaPijgByc1p+AY1JzpaXe5SGfYgeMJOJDrLI41wyFkkSZYwurv6ImFex5sCoe
         RpdMEb4YRUf0SqSV+WjiHARdLG3n/gF9DWGAJWk75B5N6K2iy7EfNUqpDy9lipURSx1k
         qlOYo7ht8mlev5QzoMhlwXPqbGcnZ+v8CNW06qAgtsp7RzX+BfW/FJi6w8Oc3kkS/SCr
         31Tg==
X-Forwarded-Encrypted: i=1; AKwUvBzbc5joPae//yyVHziIAEt0qgKDkibS58HUNsM2SFLlaeuqp2LHfD5Fo1i0/T+qv7mVWIjPzor7by1X2YOgRJrj@lists.infradead.org
X-Gm-Message-State: AFq9FYL7DTQpmk+Zk567cN3SksIbKE1ryw9PEYP/JdZ+e4/BtzHbbPsu
	0yJpLsN/5zcXze4iZ5CqPxFD89tWEGjzN7E3cCjnf1O0X33SEzIzJuwW
X-Gm-Gg: AYBFou0B3CsMHAp4vDhrxNABXWjUY+lD5zWjHq+shUcOIT7HUogyVqm6KNBn9W7StWR
	NRuBlvTH2er80n1j3cv7MPIIVwZfW1Oo3Kw1nZMBJMPlBKJCQOMrwiUB3OLWiEq2+wHtK+XZbE3
	pwaUqwyCtV1t0dXPW0IhhzgfDWDyRjLdvzi+AV7S5W1p+0C9XXNpTNHRari0XyPonll6AIfCcxG
	87kMxg3dvJ22slWkaJZnx+wazDXr2ds3h1WfdjbMUusGEGYbxeo0rGv3iSX39l0BzgV0RZTDFKk
	rwJ2uXFQT7ReNvsevAgQ1Duu9u5TpATVymV9TjE3WMEsd4RY/Mk2Bu/sPSkxywP1D9Qr8kEh8Wa
	AjPn3e61yec/Uql8JVLfz4fA8qKIEpJSNb8cs/cQvFoBm2QKpx9/tSBAqJZCn+eOuURY8P1Xze2
	arlASvt8MJVvn5uvNtjUDHLgzAGAKbrDSgsSkSO3UAWooQ7asDweQ3MgcKGcFs1kxF9cERzWtWo
	RVjxgHzz/Z/jKNA5fpq2pGOsZ3K4Xl/3jn2CcBcnMcOxUsRgsPErmRZwwquoqe0a35TXzbwNNo7
	+VAMg1tdAtiCcwfXaA==
X-Received: by 2002:a05:6102:44c1:20b0:7c2:37c5:dd21 with SMTP id ada2fe7eead31-7cb39ffa0c0mr1416020137.17.1791748935266;
        Sun, 11 Oct 2026 13:02:15 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003ee656bsm5190361241.5.2026.10.11.13.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 13:02:14 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU and PRCM
Date: Sun, 11 Oct 2026 17:01:53 -0300
Message-ID: <20261011200153.575096-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_130217_311915_FB81360A 
X-CRM114-Status: UNSURE (   8.84  )
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

Hi Junhui,

I tested v6 on a Radxa Cubie A7Z (A733, 1 GiB LPDDR4), Linux 7.3-rc6
with the eight patches as posted. On top of that I have Andre's pinctrl,
Enzo's DT work and my local DT/UART/pinctrl changes. TF-A and U-Boot are
built from source, with local changes; boot0 and SCP are still the vendor
ones.

It cold boots from microSD to systemd with 8 CPUs, with the unused-clock
cleanup active and no clk_ignore_unused.

About ahb-store without CLK_IS_CRITICAL: clk_summary showed mmc0,
bus-mmc0 and ahb-store disabled at idle, enabled during O_DIRECT reads,
and disabled again afterwards, over three cycles. The hashes matched,
and there were no MMC or clock errors in the logs. mbus-store stayed on.

A native PSCI reboot also worked without the local critical flags on
bus-r-riscv and bus-r-msgbox, and the data was intact afterwards.

These tests cover boot, MMC and reboot on this board, not all clocks,
resets or secure boot.

Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>

Thanks,
Vinicius

