Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5112C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jVOa/IdX;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bDk2IkNf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jb0UUIPqHeTvqxXRmuce2uufcIVFotyqcoN9aAY32/w=; b=jVOa/IdXTv82si
	mIcwXNxcyUdBp6F2Zt/ef/vhP15du8E8tyoASbTgOCIz0G3cBpkiCbxIp04xfxojCzlCHW7LXqOA0
	eHMj+cIkCh2j1S59+PghO739XT+ofjITA2K+AI4AEQB10yXCJRu8OQtB9UjUGvlRwM4eexyzKaD3O
	4nGglmUTdzeKwjaAgv5zeXhPNs0kPngxRrd8fwyYyN0EP2oE8HH8VVgivZ7a1pXxHkfEvzzFwEY7k
	xH+BBxxSr6pS2RPLDU0jFki1mIOjzW5IbbDLanxFF9zZNS34QTmYY4rFHc6hqDyYS4RvbXwNyi5G3
	GAdzg5zwlrkQmUF614xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnaZ-0000000Brg3-0hUm;
	Fri, 30 Oct 2026 14:28:15 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnaV-0000000Brf9-17v5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 14:28:13 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so4391915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 07:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793370488; x=1793975288; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jb0UUIPqHeTvqxXRmuce2uufcIVFotyqcoN9aAY32/w=;
        b=bDk2IkNfjthJV87cyhG74IqMW64kJqFdICucWpvSu7HIvl5ETeVQn56ltvviPSIRgn
         TZRmnYd8XPZ/7XgHVJ/I0OxE9yQlfI0uaPi8DMXUB5utAo0ixaaMI1V1IjSOnki1wdKb
         qqeHM6hxv7HeKkdwzrO7lbnWz/qf1Micz9eUVVq1byql6uZC0aVuNNDziG05r84meyGh
         yc/6D/v1CvZZqLPm+GNmEEDTDRFg04ODPK6R2TFrwsw6ap531j1Q1OHRz89HqIRZWXAn
         Rl/96oiDvhK9WvAdHlZrgFEyEsVKAzEcnpP8vBaw5iCNS6gAOrfi3N0SdKeolWNiHS+4
         NYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370488; x=1793975288;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jb0UUIPqHeTvqxXRmuce2uufcIVFotyqcoN9aAY32/w=;
        b=BooDt1cs8btFpWJdO6WqXZksYgI1ulnbyYtqRM2IEaXQIvqvaYVibEAWucsuhBfQI3
         3rOnHKq/LiltFvdaKVKGGEnxTISHa+hv224HV+beNQynHEVCXf/qKHKCoyDkgLA6w48J
         8afzurN7Dwy/r0xK/t+1HUTTjCEKRQzJb1mpzG7uKFQrRUlkh+iqNZ3elF2WqmbcMioQ
         sVAVimy5K5GgZ8TkcQq5Pm2TEeMGGogowCuGYxakrx+M8wMNWRTipxDgm3GsVKczIber
         Q7/xmDYSElh8wNv01DEh5Zq1BtcQc3iqvijmrPfAD8xrmMAgmfp8B/iAy6BJvcFPZRn0
         F45A==
X-Forwarded-Encrypted: i=1; AKwUvBxLrAkVRTMi3KlU5gKHnm6KUsRHg2O8HS5eOnfijzl0kMUVLCsgQj7ToxtSXlVc8mIz9XW6YYd0ubR2t4JkZL9n@lists.infradead.org
X-Gm-Message-State: AFq9FYI3XCTpOBZ/DI8IcsZTtohaUJkBvqHfGuJTNM2+mHpERKUcm3VL
	3zcrEyAq/NfTw5tGQ/w8FV+AvzGCWn7Yl25T/75wb6fPq1rXJZ7PHkW/aWkAsbgK87U=
X-Gm-Gg: AYBFou0umOlIhIV5NshR0swEhZ0HplFIfkOy5anTT3Bf64Ou8RDTNyWO5yT2B9YpaNs
	uuUmWBIkjXy+mNCsPWrg9Kte45iQdBp70sei1G7B/HEVAToafLtBMLowb2kSGX1kEKeFsd55tS3
	L0tx4zVdw02xKhCU2v5gvJQtXG2nJyDiwn5jxnZ7g0SYkobUmgESM7fxqeUlJnUhs8p/GtROh3f
	Qe7awLC9QeYhC8I8AIjvLzdgCXJG/zjI6s8E+DHqU6Ksg2Q6DAi0YXGFRvA3OHAKqFAoqnQCX+O
	+gmVRUYBb651YpcioIWbIJWs/YiUS1twYH2XTgmOL65+9eXlpwxJsgktS3mJI+QNKKhi5ytN/F2
	ZpQcMJPD3f1reu3AM1MCzqC0iZjE3Y0iMHxD1TklyRAVgiAajWhNR0G24Oea2a+oOjNDd7sUQyc
	AJc3C5hQiNn+ngvWQlWHlIyWdo1v5YhnfAjoH1vUR5eZYGtioLjHe94K9NBg4E0eaGoWCPKq+BM
	5VFTN40Oq5XqQprZRAGQaKoaRS5pNHXi06RtDV9Y7EMvsw5Edu3bPCPraFr/apyuJZKhWLg1njy
	FjDYe09K4RNHtg/Tzo/xeRBwak/PyHPhvBqMq8yVsajsNMXKiyYs0cps5CE9UsdXQpBm3wrUDPW
	/JFVzHGSX124CxdjU0w3luKE8gKHEYA9+1MIgy/r5Gis+yohLHK4h+S/HQSDjEyTl5++Hteg=
X-Received: by 2002:a05:600c:8b63:b0:4a1:f688:a5d5 with SMTP id 5b1f17b1804b1-4ac187a7655mr51642025e9.23.1793370488309;
        Fri, 30 Oct 2026 07:28:08 -0700 (PDT)
Received: from chomik.local (ory90.internetdsl.tpnet.pl. [46.170.50.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b286a0sm53158235e9.4.2026.10.30.07.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:28:07 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v12 0/6] Add Amlogic stateless H.264 video decoder for
 S4
From: =?utf-8?q?Wojciech_Biega=C5=84ski?= <wbieganski@baylibre.com>
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
Date: Fri, 30 Oct 2026 15:24:06 +0100
Message-Id: <179337024629.131241.9227206619077693683.b4-reply@b4>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_072811_326454_939220D8 
X-CRM114-Status: UNSURE (   7.22  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,
I tested v12 series on AQ222 board with v7.2-rc1. Firmware version:
'v0.4.ff.I0c83495.75444b3' build 'Thu Apr 16 18:18:55 2026'.

RAW NV12 frames at the decoder output were visually OK across typical
resolutions and H.264 profiles (main, high, baseline) with and without
B-frames in the stream, also with I-frames only streams. I used Gstreamer's
(ver. 1.26) 'v4l2slh264dec' element on Trixie with both mmap and DMA-bufs
buffering (on the capture queue only). Input bitstreams where
FFmpeg-generated (testsrc2 + libx264) or publicly available test videos.

Decoder (and the output) remained stable with simulated (non key) frame
drop at max resolution (1920x1088, noise generated by FFmpeg's bitstream
filter).

The performance at max resolution, tested with 'filesrc ! parsebin !
v4l2slh264dec ! fakevideosink' pipeline was ~85 fps (fixed number of
outputted frames divided by the total execution time).

Tested-by: Wojciech Biegański <wbieganski@baylibre.com>


