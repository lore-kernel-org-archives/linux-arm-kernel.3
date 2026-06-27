Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24648C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 06:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SY5IObv1DsntvWInFkK4gkjbbOppwkuoQ6M12vyKR9M=; b=J/Xwgad7DM/xI/ECFvTikYi19A
	VocJplsjgMdUVmReqKXMOhVOVApyLUQozU0SJaoJ1XnOdgFVkXJW4NYg0CIb9dlq7lsngR1XTY4cT
	+aBkQTUk5b64vS4PL/e5XH31Z50S3zo7+obPrelTZ6dDIslvAAPNwIuhhfKap6vFDK3ufE3IWnxt8
	k8bOsXuo9fn0jyRG3xcKeliD+d+QdSw9p1ub48kr26fGAQkwzxBG5IJCu2J25n1wEcIAusv+jHMBY
	MfWikIJ0WL9lIY2IVYR35E4KfpyVyg9TxvxQqEng2M75NChhlmQayWMPk1I6ais7mXXrd12/MD4QK
	8lChm73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMx8-0000000CENP-2oxW;
	Sat, 27 Jun 2026 06:55:46 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMx2-0000000CEJ7-2Sgb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 06:55:41 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-46f27bd4c45so1199012f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 23:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782543339; x=1783148139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SY5IObv1DsntvWInFkK4gkjbbOppwkuoQ6M12vyKR9M=;
        b=X5qJHV/yMmmf+4ylQHBVODaUVUS4Gu/b11doCBZ98qPrkzjKcue0YrUFNIpyZ5u4LF
         EqaGQK3PRKUi9D8B07ANW1TyOmbgqywx82T8Ize8xupdIxeFbTrMLx1klHZekjXLv4NL
         ih+x/QQfi+WnSiY6ddnYQI8gaS9RW8bQ5Cjkz/PgzGg92upkupYJ8tutpUoN93Xj7YiS
         ztkFJ6TnOwZMUon6h/npuEY7r+W1f+jeohhj6gv2ieiq1uPMQe5KYfdQaN+Gw5VeDkCP
         OaNG1UpoIsi8qcfWB0Fr2VCRXWSndAE5IWcJKhnnY/2Li0eAPETFS0qMOxMGgHfE+tqC
         DesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782543339; x=1783148139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SY5IObv1DsntvWInFkK4gkjbbOppwkuoQ6M12vyKR9M=;
        b=OJ2Jewhu9FJNZCYY6I5yb6zIBzQw/wo6VsRIqZN5JOxn2NfmNGlAt6BwtJpAYiHG6Z
         e+mQsclDQ+rJWj8PAZfiR/uVxkgGnqFH1Ke4VV30O9uvWAKb2Tnkvf0DvJrBD2rG9k1H
         YRtd/Y++fvc/ByP76l7jA6jCV9AxGNkDDA4sMglpNExy/ISABP4cDVo16ODqTNMTYoF9
         pPf0MTvLpXLtgnxDDLjFAgV2hUkIHm0zE6KFMuHg+1XCe8eFzbddnm3TpWkVXBPVdEM7
         hIcemmOtoAInCFuGsNWPLoZIkunNZP7eRimgRReHPkNrhWWCDx3jLOW1ixVBjRDG32no
         P6WA==
X-Forwarded-Encrypted: i=1; AHgh+RqnwNqyTXTnZnl/T6VKXwxWppheEI4x7DiRI4p0Q3x+/cpZojoNh/gRJ7Lc7ddeHBrh+WZrDXDuGSfMOuuGsyNo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgygc1KoPEPViqlKiY/uIB0c7bAfnnYxaFP36F0CuNNKa+Tgxn
	6DVvDk77yKJx6NWkPNl+E5L9flbPB42YZzNZFnmHqGEWHKk+zV48J+FdmkLTrBDD1qpL
X-Gm-Gg: AfdE7cmU/Db74Xfp65YI8bJx8lM+K/t4OzBxau/W4BCixAof3DWTJ59jTn+zivUSdNM
	9OKXWqlzNsEWC9DqZ6HBRkAEMs1Tv++feDCWhDCmlwjcgIWuZ4xKQt+uynhvo25iWwXoBAvKtR5
	vMTILS5mx/9JkHd8gxl1zPk+elVpfjNDggAj/a/tEOXSxGMWzB9nL1TyHkrk/tUgvtkQy744RPI
	Vbv5SXOkPYqZJNmI1HUsT0FiVUYSi76t7achkcDcPyEGFJ3flmeX+LCjEjZjF5W4+SsGO/0EVbe
	V/3DZxBlccXEP/pRK/LK6qv7vFveAT6K/IMlOo1TtJaEuZmdCrhAoe8R4CKTQXgxOOnoHJ2uIfi
	f2ZwThRcmmFKwQKdz3IDG1o6bc1Ma5XAVd9+t10MJek+LMR4zSM9VzmEgC5Z0EfmVOJIxTRp0LQ
	Gz9tzbZHUvOx16JaqCOyMX6rswj+Ap3Ynz10hXtUhpCqE7BRkPjY7xP7o7UVCBh0LdCIofhK8Sz
	CvJ/bJFmKw/8GsPsXxlrndX3CG3lOiHGKk=
X-Received: by 2002:a05:6000:4204:b0:460:30bd:4dca with SMTP id ffacd0b85a97d-46dc12e056fmr15051536f8f.30.1782543338095;
        Fri, 26 Jun 2026 23:55:38 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee0189esm32691380f8f.9.2026.06.26.23.55.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:55:37 -0700 (PDT)
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
Subject: [PATCH 1/2] media: meson: vdec: clear stale prev_frame/cur_frame on flush
Date: Sat, 27 Jun 2026 08:55:33 +0200
Message-ID: <20260627065534.88527-2-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627065534.88527-1-doruk@0sec.ai>
References: <20260627065534.88527-1-doruk@0sec.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_235540_641577_8D4AB87B 
X-CRM114-Status: GOOD (  11.02  )
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

codec_vp9_flush_output() (the .drain callback) walks ref_frames_list
and kfree()s every vp9_frame node, but never clears vp9->prev_frame
or vp9->cur_frame, which alias nodes that were just freed.

If decoding resumes after a flush with an inter (non-key) frame,
codec_vp9_process_frame() calls codec_vp9_set_mpred_mv(), which
dereferences vp9->prev_frame->{width,height,intra_only,show,type}
and feeds vp9->prev_frame to codec_vp9_get_frame_mv_paddr(). With
prev_frame still pointing at freed memory this is a use-after-free.

Clear both cached pointers once the list has been freed so a resumed
decode starts from a clean state.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Amlogic Meson
hardware required).

Fixes: 00c43088aa68 ("media: meson: vdec: add VP9 decoder support")
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/meson/vdec/codec_vp9.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 8e80ecf84193..5ca27930239f 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -681,6 +681,16 @@ static void codec_vp9_flush_output(struct amvdec_session *sess)
 		list_del(&tmp->list);
 		kfree(tmp);
 	}
+
+	/*
+	 * All ref_frames_list nodes have been freed above. Drop the cached
+	 * pointers so a decode resuming after the flush (e.g. an inter frame
+	 * following a drain) cannot dereference freed vp9_frame memory in
+	 * codec_vp9_set_mpred_mv().
+	 */
+	vp9->prev_frame = NULL;
+	vp9->cur_frame = NULL;
+
 	mutex_unlock(&vp9->lock);
 }
 
-- 
2.53.0


