Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23A6C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8sg4Ic+uUI0uGmJLbnp+7IK0wyVe9CAzpqU2xH+Oy4=; b=4s8Euvlf2WS6vW1As2ELyj0A9W
	gCBhPJZqLyakEPeRc3rCOgO8JNe7oCtYY6BofiypygnB1NrSHM9lVeA0Xo/FVqi4DrjJOKswgl3hp
	Zj/BgzuA72BglDCfRcZVhw/PDLE4koSF5Bjfmq6LyR5luc71n5zY4JqsSfVvDZ07N5HlCtroMtZ1q
	FaPNULNzZXbXn78/WoD7TFJrLMR/WxseZKD1Q/yLCuyP10v2eg7hneohhlaNPTuTKaqdVdjx7FRj3
	H7DaERIweaubSkNrNiVcr8kpEtKtTT6oF9kpTHcuRLVQSiGUdB3zKSaFFzvOnW1K2WXh0oPCrSh5j
	CKFU8QGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AXB-00000000CMi-1oB5;
	Thu, 03 Sep 2026 16:43:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AX8-00000000CLy-3dYm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788453806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V8sg4Ic+uUI0uGmJLbnp+7IK0wyVe9CAzpqU2xH+Oy4=;
	b=CZ04jNUwBq2efCl/RwUwzA2lCLhz/FsK001YdvoA1mZctXbPo/v8pndQN3BvyvFC/BuTKL
	SmMAqOL41vPbNOnW42VtH9E5EB0Miz+dAMc+vR34Xfh3cW+OwXoEKb/6ySZvGJAyiPM131
	rviSBqdSzuryEdHg1JRoNBScC4onLmY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-lgMfL_mQNCyXImrovm8CwA-1; Thu, 03 Sep 2026 12:43:22 -0400
X-MC-Unique: lgMfL_mQNCyXImrovm8CwA-1
X-Mimecast-MFC-AGG-ID: lgMfL_mQNCyXImrovm8CwA_1788453802
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9375d92d8cdso575171085a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 09:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788453802; x=1789058602;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8sg4Ic+uUI0uGmJLbnp+7IK0wyVe9CAzpqU2xH+Oy4=;
        b=GNzYS1OS+DEiO+qk9AMWPFum+BP6/cTFZ7FFEEPzrdlVVjc8yrSz7dWMAqbzSWv1XJ
         23uxfNL0fLVFSDIdm4dbvi+pD996AHeLNLyvyezOt+rk9+xHaXgd7RSz4pHe17KWbn/P
         x7ZgiuPCk4ALl4l4lEcGK43gCMMHaA3ZBHxuhhvEEtfr2OYwudUGqTu1Vh89WEX1zUrp
         DriNHtF50imVIFWxWVo0eMtRLVKjF9jgPDT+3ZQDfVvjDiwflSzZQPft/MX+D0NR5clS
         Hhey+Gvlu95oY2+9LOGHN4C1c7oKaqMjHWb+Sq3r3pKMdksAv2NxUiEXRZ/4t+dt2g5p
         7Uag==
X-Forwarded-Encrypted: i=1; AKwUvBxDHFeddSmR0OZu/DHVWnEz1q6IiFroWQg6YDepnpXdrfGl0SXKP+ZaY4UOEjjDD7PqcycNSCfCcc3y40QZ2z6H@lists.infradead.org
X-Gm-Message-State: AFuF++kpNnQELlGBJ9HTg0uBwCnFrsRbeR598f6hH40s7xW2HouTVYAQ
	4j1BEEM6l4Ir0N2WrOLvXXBqEU2bP3jxYfWIdaNZn0qzhziRbpq7g9x0RpFSkmXvHjnV7jrMUGF
	KZr3F++yHo6xqAwNMac9GfpS8rrPeoa1R1/J7p7bVsGkg2cL0wKj810scKwy+ubT956muyJkTmC
	zA
X-Gm-Gg: AYBFou3I/vFCagHmIs1hlDTDA49kvHYyWDKRU/l5vGTI77foiYeZI2Icu+/tgFeaT63
	vgMKVsWAxe8cEFcbBcLJoV3Yqo58edH4imylR+lly98LEmj/qgz4tHp6rpN90n3C9/ovsu2LHAu
	0SvYZRXG7gsTAGl9QLv8/Z8Y5XYD4dfF7x5gcJKa4i6NVFfNQj60H8eDlYFeKxbOv51Qzx4h6W1
	z0ZNQXlLnD8LNrhhxfMiYl8s1qQa5esCbflqN8z0w/flWaIk0bRd+smMBfApPIb86UQOruE4j7f
	OgU6tRQ2XQujnRWizNNb+5yy9eRmdoiJKS+gtTDC/R7uUMap+okaltbcpkPvxXstABKD356NOoF
	IC8OncQ0Gk/rEKcHTixy8l4r+ZyFV3IBMWvgYe2w=
X-Received: by 2002:a05:620a:6187:b0:939:6df3:d7f6 with SMTP id af79cd13be357-9396df3de25mr992394685a.49.1788453801810;
        Thu, 03 Sep 2026 09:43:21 -0700 (PDT)
X-Received: by 2002:a05:620a:6187:b0:939:6df3:d7f6 with SMTP id af79cd13be357-9396df3de25mr992386285a.49.1788453801386;
        Thu, 03 Sep 2026 09:43:21 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee270d0sm47491336d6.18.2026.09.03.09.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:43:20 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 stable@vger.kernel.org
In-Reply-To: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org>
References: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org>
Subject: Re: [PATCH] clk: mediatek: Add missing depend for
 COMMON_CLK_MT8173
Message-Id: <178845378565.22448.12859439275506649984.b4-ty@b4>
Date: Thu, 03 Sep 2026 12:43:05 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=317; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Y+oggqG3Z8L+JxkjNpwIvq7dXqEwG7Da2Hajvvt/Msg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJmLp4vln/w9uWnFpMnBh3+s5IzyCRo3jTeQ88mBbj8y
 GR/EvCgvqOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJ3Ahg+O86/dGb5RGeNw8x
 nv+Y6dMhWWrzZE5A6oGlMo+NmKP7Cl8y/PfOydx3s8egMeH7vrvRv2R+z3jEeTuj8P9/m8aGvU3
 r23kB
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TPRNN2XKLFVTd_u178abf_2ROPzhkimGjHjcy3-5BNA_1788453802
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_094326_970623_F54345D4 
X-CRM114-Status: UNSURE (   7.70  )
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


On Mon, 31 Aug 2026 08:50:56 +0000, Ricardo Ribalda wrote:
> clk: mediatek: Add missing depend for COMMON_CLK_MT8173

Applied, thanks!

[1/1] clk: mediatek: Add missing depend for COMMON_CLK_MT8173
      commit: 84964d0ce3faed815e1b8e048ce5ce1c93badb18

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


