Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063EACA1016
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AQznFZ2/CAp5Ia9g3+t36AoVZFqyxkghcnOS1fDxNvI=; b=PpPA2j92hdv9yAnyw8Ao7JsQbV
	vGks5fAluFGnJBw6Eu6uaieM1maDpOab6xNQp2x1ntNAsyWBxJrfjz9YC0TgZEMo4nkwzkT+tDC7O
	XzRwg4I70t3EB4SwesnCTNfsYAChdA8Mjv6X+Koeev8SKOuuadqFh9wXchUngxGZtbHTTrRuNNaAT
	0oYrks9Od0t2B1iCZTRTfk4O0C7XrHhKnBA+38/69AgWUg1YV4g8oaXLMX+Xg2wI1+DeSTjyKoWow
	aI5Bc1VrZ9uxN98WiimpgEBiOaKzYsDtyPCWWEHabzyaz2ZiRWhRBlPTEdq1Uxu1UQUmM/B/9kSZP
	csfQQFqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYYp-00000002pFL-3e6F;
	Fri, 05 Sep 2025 15:41:11 +0000
Received: from haruka.juszkiewicz.com.pl ([185.243.53.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuUDJ-00000001F2M-11z8;
	Fri, 05 Sep 2025 11:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=juszkiewicz.com.pl;
	s=mail; t=1757070159;
	bh=0WWTGQsEQ9lzz7bJ7y89bwI1VZur0nT4lh7qtGAWR4Y=;
	h=From:To:Cc:Subject:Date:From;
	b=gWSqpyMfGPMwxB+fAyLvrmVa3xWV7K6GM8o6Wp641za9iXv68v45NEJeGa9jul0hy
	 fbMbstBXwCdBPeHFxcYA6J7syabjRcCJpEW+JPkBMwHy3YeUEw4Rydlm6DLUzBrURr
	 cTBaANzIjaN8ZXhQdGJY4u6TWX1PlQNx39/nO6yoD5JkXVQmBjxmUfQ2QE/EF/q/Au
	 btdAUI00sAi/r6T7aCY33q3Op6xhT1wX7mi3U/pPq7HD1PEuHeMQwodi0qoWqQ6lxi
	 2jc1rVUfPXOVqJ/pzueRVBRinxQMMsQ1lWakq2m/FmkqSQv+4dhzDmX7svdo+so3BG
	 SBuS13MbFf8Og==
Received: from utena.juszkiewicz.com.pl (utena.juszkiewicz.com.pl [158.101.208.177])
	by haruka.juszkiewicz.com.pl (Postfix) with ESMTPSA id 70A751FB29;
	Fri, 05 Sep 2025 13:02:39 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB62B453F5;
	Fri,  5 Sep 2025 13:02:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=juszkiewicz.com.pl;
	s=mail; t=1757070158; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=AQznFZ2/CAp5Ia9g3+t36AoVZFqyxkghcnOS1fDxNvI=;
	b=aiQNrA+9ezwZkkfwIxLK7lUExyZ+S4bj0MGCyYKQ2eqcljH/5xS/nNQ1J0ap8losZOWfTb
	NrNhAsr5MA3n7MdDTrAv6g1vFZuyv9gxH1lpfdxRA6peIA5wE8RvHmVVxl1o+WHDxrke3X
	J7vBDLAbbfTzr3iYsqLYz/Ro5jWKQcMKmEbxK8oANCUJqMJaJAML03F84aFQh5NPzEVu5T
	WaBN2vqNMadKGKtwn3kAIvJ8A6S03I4F6z63HUnDfnxvZ8OSKOiHQj6uWqUFJOdhkgb/Hg
	8RcbxZz86Fi4QMoWuA9bEUr+JHfpehWh8DHAW3GYXrL65HYGL1PFOL259PwJQQ==
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Subject: [PATCH 0/1] Enable HDMI Receiver on NanoPC-T6
Date: Fri,  5 Sep 2025 13:02:29 +0200
Message-ID: <cover.1757068166.git.marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_040241_457338_15F5D7BD 
X-CRM114-Status: UNSURE (   9.29  )
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

For quite a while I had this patch in my local tree but never made it
work. Kernel generates the following messages all the time:

fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: signal not lock, tmds_clk_ratio:0
fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: mu_st:0x2, scdc_st:0x0, dma_st10:0x10

"v4l2-ctrl --all" reports that HDMI In is detected, /dev/video[0-4]
exist.

I tried two signal sources:
- AMD Radeon WX2100 (via passive DisplayPort -> HDMI adapter)
- AMD Radeon RX6700XT (HDMI port)

Same situation with both - kernel messages as above on RK3588 system, no
connected monitor on host side.

Usually I used MPlayer or MPV to check v4l2 devices but here it fails
too:

$ mpv av://v4l2:/dev/video3
[ffmpeg/demuxer] video4linux2,v4l2: Not a video capture device.
[lavf] avformat_open_input() failed
Failed to recognize file format.
Exiting... (Errors when loading file)


Checked SBC schematics again and HDMIIRX_DET_L line is GPIO1_D5 like it
my patch.

What I go wrong?

Marcin Juszkiewicz (1):
  arm64: dts: rockchip: enable HDMI Receiver on NanoPC T6

 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi     | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

-- 
2.51.0


