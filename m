Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F3FCA9ECA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 23:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FybNLzC2qT6eMhACQiNU/7Tni+cNIjGAb7dFyWED4A=; b=LNQ/METy70fJUMJOwpiTn+BbSH
	HVzuuR18zAqaS76LPaYYuP8O/q0eU+MqJ0cK3z0ur7R2qi8bbxb/A3byuMCirAgRDNt815VqKqky8
	Iv0BFvTWtFET7tL+XVIONetqJ/bquj6XRaXTKblgTS72xxkh1Sk5U17xl/h5eng+Erzb/z2in+BBg
	h9ZsjbhB5YmAgLo/V0PCJyPYm5TI2GEugK6PsWsRb9dPJ0A1M6u2SRh+BZP/+p/9H9f6nUbchaVtX
	ICXCksfcHpS03hWgEp5/Su4SGTRdOuAwMWn5hBXIREecfqHOnj6s0OYS1fj6nU5epqRnDmdDwEpvO
	4lSTc+Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFguf-00000008Ysq-1wCi;
	Sat, 10 Oct 2026 23:55:37 +0000
Received: from mail-qk2-x0b.google.com ([2607:f8b0:4864:34::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFgua-00000008Yrw-2SA4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 23:55:33 +0000
Received: by mail-qk2-x0b.google.com with SMTP id d75a77b69052e-5350beb1d49so8784801cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 16:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791676531; x=1792281331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9FybNLzC2qT6eMhACQiNU/7Tni+cNIjGAb7dFyWED4A=;
        b=RS0vSO3yI+hW1ff1AtOO7sTYId4GEfv004pAY6tkU5fKvZ6AN5hWgQBZLCd2l4lBeP
         KTRGpr7J0htwzc4xJAutt0+eQSMvOBKJKP/8mx57XQML3DlpWZSZvkOh4C/iX/vq35Fj
         o0vF/rDCoAV+//jlusLdSVf9z/C1TGIehHNdM/H4llLhEGBThSETqYGg2ot54mft/PMC
         FA7fpEBVnoUof3VZACDoig8i2zENCssdg4eFdB5POMfOumERZET2nSZdeGdJh7RsMRFA
         m0UmzXzKDpemFjc8uRLtcqyiY/Hp7n3nQeoko3e1rQV0iG2OfTPPpyAUdtLkghkUtlnu
         yvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791676531; x=1792281331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9FybNLzC2qT6eMhACQiNU/7Tni+cNIjGAb7dFyWED4A=;
        b=UBF5o5T4y6pY0hT1ahzwQZJPE8M7OFqGZ7So0T8EWLoBQ8/67QkvVl7+nIBC8ywjX+
         al6MMxyBtPwvBrZM4cokcNrDevYou5BqsZpx1vT4XAvsxdGdM5e0xHRyyTDIxSkC2m+6
         WkxLMPqCrF//UBY1K/CF0qNYYuTDLVmIBff663ZZbm6ftPUGJQlCS8uXUw/qHb6RnHw2
         tVoVxtva6BTwYq3SaNHseku5hPeq1kS6GteVGSU0VhzTucOb6+zh25N9UBZlLfdVk51k
         am7iUsQrphd0p3aoRBe8+rm6U4nXc7yxYNFohDFN+8FlN9dtAzrfpwZr9Bzz+NDI0Y9Q
         x/kg==
X-Forwarded-Encrypted: i=1; AKwUvByQY1xxortKP64SmyjQ2iCJXwd6ijmWsvNpD1zLE/1gvCaWprhWbZMoKTgvPoMnau1U/JgAayMF5VR188SEI+v1@lists.infradead.org
X-Gm-Message-State: AFq9FYIv8LeHhPf0H1nHp4mrIOTdIPr0K/yEFIACKDsdzKaqLKdmsH5T
	FWklWuK1dHrJqM5KoHA1Jh/f8LCT93HRM17JvcaVA8X130mcctHai70Q
X-Gm-Gg: AYBFou23FH5SM55czJs2fRJxll4/kRvLjQfn9iBo+gNd+7w50B4wO++MBkE/FisL96S
	2uYYwl2rJgSjgZ5HYiAGiQiJVmog9uhjOdpGyfGiuE1h20Ul7xSUILPo9+LqcOWtuwU2tQq2BoE
	NPdeFXNZ2S5Eumy5R8sWFzZW50h3MrkT2vxQbCTVOT54F6ZoEhzNVWoVNd5HCyIx6jEhZ/x9+Po
	cVzxTqDJLWjsGQTfi/H3OwlF7ncg7HVQCPQ7Phh17mRofVLZ+RkyUaJqjrJZLUNSs7g6EtyGn9j
	n1jyoMvkUyr7GuUyUxOQFzMWhCvAWYnSVtjM42a/S4u9MzCpVoinujZxgZTtt3XUmBgKsv0ilry
	V021CbzBntqOc75u2o1k/FgSI8jKoB6Oe0aeCUUSwfeL933nCWS5o6WgkJ72xFmu076Jz5+yj3A
	BGkdsaUzWXJ8E0DgrWAXHbncKKLNCQDNwETG9AT6ycuM+7oGL4YeC0ULLJnYoKlrDNF6w=
X-Received: by 2002:a05:622a:1f8b:b0:533:96b4:8dd1 with SMTP id d75a77b69052e-5359faeacd8mr96963691cf.26.1791676530862;
        Sat, 10 Oct 2026 16:55:30 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b755c35sm49184081cf.15.2026.10.10.16.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 16:55:29 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Irui Wang <irui.wang@mediatek.com>,
	George Sun <george.sun@mediatek.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Yilong Zhou <yilong.zhou@mediatek.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v11 00/10] Enable video decoder & encoder for MT8189
Date: Sat, 10 Oct 2026 19:55:18 -0400
Message-ID: <20261010235518.1078376-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791623422.git.kyrie.wu@mediatek.com>
References: <cover.1791623422.git.kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_165532_699849_45596C4D 
X-CRM114-Status: GOOD (  14.51  )
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

Hi Kyrie,

Thanks for the series. Test report from an MT8189 Chromebook (Lenovo
IdeaPad Slim 3 Chromebook, board "quigon" of the skywalker family):
next-20261008 with the other posted MT8189 series and this board's DT,
plus MT8196 decoder v8, MT8196 encoder v8 and this v11 on top, and
linux-firmware's mediatek/mt8189/scp.img (FW version e3c0782 Jan 30
2026; identical to the image ChromeOS ships).

VP9 decode: 240/240 frames bit-exact (1080p test stream through
libva-v4l2-request, checked against software decoding).

H.264 decode: the SCP hangs (watchdog timeout) and every frame is wrong.
The firmware has 'reserved' at the end of struct
vdec_h264_slice_info_ext (after crc[8]), not after 'timeout'; with the
current layout every slice parameter lands 8 bytes early. With only
this change on top of v11, H.264 decodes 240/240 frames bit-exact:

  	u16 timeout;
 -	u32 reserved;
  	u64 vdec_fb_va;
  	u32 crc[8];
 +	u32 reserved;
  };

I don't know which layout the MT8188/MT8195 firmware uses, so this may
need to depend on the platform or the firmware.

HEVC: MT8189 is pure single core, but the firmware capability makes the
driver advertise HEVC_SLICE (and AV1). The HEVC backend only implements
the LAT + core flow, and setting an HEVC format (here libva-v4l2-request
probing its profiles when ffmpeg opened the VA-API device) sends an
init message that crashes the SCP:

  mtk-scp 1c400000.scp: SCP watchdog timeout! 0x0
  remoteproc remoteproc0: crash detected in scp: type watchdog
  scp ipi 14 ack time out !
   scp_ipi_send+0x2ec/0xd5c [mtk_scp_ipi]
   vpu_dec_init+0xe0/0x29c [mtk_vcodec_dec]
   vdec_hevc_slice_init+0x88/0x250 [mtk_vcodec_dec]
   vidioc_vdec_s_fmt+0x2a8/0x450 [mtk_vcodec_dec]

Not advertising HEVC and AV1 on MTK_VDEC_PURE_SINGLE_CORE (clearing
MTK_VDEC_FORMAT_HEVC_FRAME and MTK_VDEC_FORMAT_AV1_FRAME from
dec_capability after reading it from the firmware) avoids it; that's
what I run.

H.264 encode (patches 9 and 10 on MT8196 encoder v8): works. A 720p30
test pattern at 4 Mbit/s through ffmpeg's h264_v4l2m2m gives valid High
profile H.264, 60/60 frames, about 49 dB PSNR against the source on the
first frames.

For patches 9 and 10:
Tested-by: zoan37 <agentzoan@gmail.com>

Two board-side notes from bringing this up, in case they help whoever
writes the MT8189 DT and multimedia clocks: the VDE0 power domain needed
the larb4 gate as a subsys clock ("vdec-0", as in ChromeOS's
mt8189.dtsi), otherwise only the first decode after VDE0 powered up
worked; and the VEN1 clock controller must not use runtime PM (VEN0
then failed to prepare its subsys clock with -EACCES in the noirq resume
phase, genpd marked it on anyway, and every resume warned about
"already disabled" clocks).

The board's patches and notes are at
https://github.com/zoan37/lenovo-slim3-chromebook-omarchy

The testing and the fixes were done with help from an AI assistant
(Claude).

Thanks,
zoan37

