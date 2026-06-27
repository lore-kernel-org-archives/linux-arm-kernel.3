Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C864DC43602
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 06:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6URRVOLLPbDGmOPQIy9/O+A7E0jEC0aohmFeB/EeHoE=; b=gMN/qCnxhtX1DPAe9o2gE4x2R8
	vEsLRuBFE9Pf1A2tEGZ9vpLdL08XlB92HGjcDPX69NiANDEJobWJoWV157KobMBIxO2llgWo/BLFA
	TxQiTPCgciazE/iNRB6ghzESI7qcd0bjgcwBuxPKzXPQa56UEkk4evAumKE1szKwTFDVSt0d4e5m9
	Hhak3nVZQhsbCL0g5y2FZK6h6lOcxyEmQu8w075chLqa6K7rToTRKpo38lseKGxgnOJAZfxzM0bSE
	moOCoh6Lsj3QFG/TJ5I9TcAs8IcrnKYEgrsjaqSDQTe0+GGR7GYhbIZycDncLh0Hhe2o0EOPxWFsq
	wEHlhXHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMx3-0000000CEK1-1m7w;
	Sat, 27 Jun 2026 06:55:41 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMx0-0000000CEIS-31fB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 06:55:39 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so14606195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 23:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782543337; x=1783148137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6URRVOLLPbDGmOPQIy9/O+A7E0jEC0aohmFeB/EeHoE=;
        b=h4MPjb7oJgch+TFHnuKIUJ5CRuum7YMncQ3DTeK1Vn+xF5HGH3wXIs7uWRtBy1w+5r
         jAc6g/Q5iv6d0dDGIXVvqEELl1qOCHpQWLvwrEA2y16EUEetb4h8Gr3WYhxg9Hy69Eqr
         fp05ej2vvbKM0uhLo4loGF+idQZfhBDCPxlKoaJj07N+vccuW74+qQj8B0kyevvfvRNj
         vuiLR4vteGSgQ9lN8va094tu4R0kPnvSOEjUNdKhHxCrhVqhMtNAa3wGMlWXMI6qjVrN
         At3k3VioEeGdCax2EPooTqD1LpmaWlQ8Kv5xjH+k/9uX+xNzJSo15ZltJ8KMx+hUYK3+
         QfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782543337; x=1783148137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6URRVOLLPbDGmOPQIy9/O+A7E0jEC0aohmFeB/EeHoE=;
        b=jcKcWKzVyQ378SkLk1uMzEPTzOBtZBM+DHEkI81/BU/h4DjtSbCNVAdq9ETaQrz0Pn
         9NMtoLqQ+G19NXayB1+CV3trujnVlyKvFSuLh/b0z3219CG53/hJi3uGTQ2FVj9k+nKE
         seWCtwuv2HGu0f3eQF63869by+jYMA9flQu0anUVTtNpDynNPq2K37aMZeMHUajGRfk1
         Qs/0p6n6c+KE06VhudhP6qAmMUP2PogMYIjHXypnsLNiOmdT5JXZt7bW2Pdbnqc0BZt2
         ZpysqjRETuJuh6CzdfQteGgFROsHe8T0oNqkTiG4UCi++75OJWWMaQhzMzOBQSOmUBoO
         yelw==
X-Forwarded-Encrypted: i=1; AFNElJ933BfZ1Iubr2iVgZT18W6bmXGtDUsqK8U1333ZnG70/KJLG8IFAvOPgWrEjyDTzgqZaFAaY12UVuL8UVxpm1hY@lists.infradead.org
X-Gm-Message-State: AOJu0YxD2jye/dVNiFpamUVJmUHNpeGi3/SCi2vnU3WIXWbBOFhgQWvX
	B+AC4EOo1KQ35MMamSvZKwkRVdkuIZ+nN1RXnL3IH2JaKeaWIJ1nck/mkvvVbB5JM0LK
X-Gm-Gg: AfdE7cmR1nS2yqicMJvFQyAfPRa46Wo661JxgDRqmpHPFHL5KAijfwdeJ5pXyuWVMCa
	VEtCNFnurCo+EaC/JqAxMENcGLGbDJYna72FRtXfrnzUclcg/vPBzLX8bE9qeFvAuwiIyzwSDH0
	RRybA6pCyfpbYCgsBboRNRlrn9xJtzS2+AvK3lHAVzrtEzzaTBIlc/k5p6+s5KUDKD7TK3g6m0p
	TofSFpYvvTfndrvU/sHnKkS+65M2c3Jj3vpxOKRgZig6NAMVq9DTjMIhgBINWl77KlxpD8bTilH
	D1332DE1bzZs1p8lNWeB+PGfQrRyLoFEDq4OPOtcANawl0/8pl2ds69TEks6xMF+xHCHSApGwIa
	MgfVJ0sp9zAZYWqQK7JaTVhdeDIx3vLdKmCUTNcVw5KzsHdmIyxm1B3iMYGrbcFm9k8mC5cpMie
	K8gNaiZFh61nG2qlYhFt1PkWBDqUXzckwDNWsipxIxAMOt+o1BKax2i4uop4zFpr7ZxbNjNugtw
	BG3E9I/JDmTIXhaDOZxjQrs9s7ASt8QudU=
X-Received: by 2002:a05:600c:820a:b0:492:6eda:4296 with SMTP id 5b1f17b1804b1-4926eda42afmr59822545e9.8.1782543336727;
        Fri, 26 Jun 2026 23:55:36 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee0189esm32691380f8f.9.2026.06.26.23.55.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:55:36 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH 0/2] media: meson: vdec: fix two more VP9 reference-frame lifetime bugs
Date: Sat, 27 Jun 2026 08:55:32 +0200
Message-ID: <20260627065534.88527-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_235538_802271_86B77CF9 
X-CRM114-Status: UNSURE (   9.07  )
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

While reviewing the earlier VP9 prev_frame use-after-free fix, a
Sashiko AI review of that change surfaced two further reference-frame
lifetime bugs in the same decoder, both rooted in vp9->prev_frame /
vp9->cur_frame not being managed across all decode entry points.

Patch 1 clears the cached prev_frame/cur_frame pointers in the .drain
flush path, which frees every ref_frames_list node but left those two
pointers aliasing freed memory; a decode resuming with an inter frame
would then dereference freed vp9_frame storage in
codec_vp9_set_mpred_mv() (use-after-free).

Patch 2 guards codec_vp9_set_mpred_mv() against vp9->prev_frame being
NULL, which happens when the first decoded frame is an inter frame
(malformed/adversarial input, or the first frame after a flush). The
function dereferences prev_frame unconditionally, both for the
use_prev_frame_mvs computation and for the previous-frame MV read
register programming, so the NULL case is a NULL pointer dereference.

Both issues were found by static analysis and are not yet runtime-
reproduced (Amlogic Meson hardware required).

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).

Doruk Tan Ozturk (2):
  media: meson: vdec: clear stale prev_frame/cur_frame on flush
  media: meson: vdec: guard against NULL prev_frame in
    codec_vp9_set_mpred_mv()

 drivers/staging/media/meson/vdec/codec_vp9.c | 37 ++++++++++++++++----
 1 file changed, 30 insertions(+), 7 deletions(-)

-- 
2.53.0


