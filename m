Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58BAC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 18:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Date:Cc:To:From:MIME-Version:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d/rpMCJfGm+xUSp3I6jJkmErPbYp+urUEQMWu8yYzcE=; b=KDDkl1Kt0lb57wzTrwCMZIEuax
	5Ad0tzrMBWhKfhoS0qJMpAR5Qzn5sjIRB+fu/Yw4Ngv5GDuPn3H8SND/u+clq4nAKmbM4/PlYEpkR
	qDprOCekuSPeedLy+JNJJNdsiCCGAZdBjeJ2Whf9ZWAyDbkHvO/sqgLJ8Hc4OO2X2+PhDi1d5+MnR
	m1bqs8/oeq9J/f9rC+P+FusatPlwgSSFwZSbsBnE3e0C6mb9qltt41Q6CInTYDQkvPdKY+TP3p9YQ
	wKo++7HUfH9WmXwDsuMOmeqhf1y5ikN+eE+gxJlBYjImbevVhf6mYm27suwDMbnVJ96PhkGqwVGmu
	M1i7cefQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZCc-0000000HEq7-1c3m;
	Mon, 24 Aug 2026 18:15:22 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZCV-0000000HEnw-0w8x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 18:15:16 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ce7d2adef4so49638905ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 11:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787595314; x=1788200114; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d/rpMCJfGm+xUSp3I6jJkmErPbYp+urUEQMWu8yYzcE=;
        b=nKx7WDb7QdMn3dZi1EO9nQK+e4dcP3UbrQ/Fqb5Aiy+Wu3wAvLenyXwAW5JPjWOIs2
         Mhl4hUwgVWoBVCukv8jApTrFdD6dIb+OE+AQn8zN6x01iWtKhic9VVHBxdqZ+9drICCD
         ad2gtJNA124/HsW9eAWK/r12jGpkvc4GYFzj5SP+KsM12s/WpNNKF2pm3qJBQvzDc0SN
         gjBr6RCuYp7WtVD6ew58JycBSjdojRRC24sZ3e5QUCMsvy6pOoYNC2LbO1c0bdNRatEG
         Jdg95FWzGY4W+mab2EWX3gJHHmr7QRQELcceRFkRbFf3wITNzQyu4R2/DkDBnUvczvry
         xXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787595314; x=1788200114;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d/rpMCJfGm+xUSp3I6jJkmErPbYp+urUEQMWu8yYzcE=;
        b=GBBq0f5LUMcnvrqQhGjldI/70coLrsqf4iM8yWbjOI25y7H+ztCIV1usliLtx0lqi+
         M8nFrpPkbIUlH8mJASsDI7iWgDKYH5cILllTh5Pf0lJzb9OhzmCx07Qd12qlidHi8Jb7
         DX/kgf98NdoJqfVp2fIZ8RuD6eltBkP98tUlaaHnXP3PcI/tAkToGpJE1XUh52SKnStC
         lJpEAvc/HcypqQCj95yxSvujY1rb66Ss3MoWGdPXaAGCgrArRYDLKrKJ5oayWVyTH88H
         H4dEil1cA1rwtXkHAP7Fl7Js+YzOp26Kg+/1KqYiXHookydNGld5k7jctPVYVwGKNW9H
         TIfg==
X-Forwarded-Encrypted: i=1; AHgh+RpIt3LrvAq4JFpo3xUl0Q1SyZ+jCB7jViCu3hHMXSOHu52UAcuyr5UrX5sVciCpIU3TGFGrGxtz2+r4Vu2X/itL@lists.infradead.org
X-Gm-Message-State: AFuF++lwtsI5EgQUYqDPe7lP6ZT1kJ6PW04J/tIpFJwEgdQGgrH2FjQj
	30F1zPUEcMfpcL9T5Q/tiTRLLHAJYaOG1HnOsyn6xkH0q2Nxw3/LAbMF
X-Gm-Gg: AR+sD10HbgQFIY/SyfH2UGhPy/z3TWoPCDPo3j0dNvI2Wo0mju9k5O7h4CgUikUrfU1
	QxVOJ4cZ5x0iIMXJL2CVhi14NqstjrM/0ISl/L7BEpDGaT/NHsRvtFp1fsV0UFEOQiNb9N8vKTL
	Ts3Ovbhe1h4ari4dcdHgRxU0lmENW/2fOKz1zAqQq0BbMAQZ7y643BTb9nH5jtQdxdIwvxx5kOF
	enQ6rZiKXzEUAcpsfz4mEpO+x5gNwq5b5LbGvjNy7SamskrmIi9CEjxWCVWcUBDgFth1gyy4RA0
	qm4pRgQmHA/+ggA7mBnsgfI9w6uvJgGq8yZ/UZqYLWbytYkcGdOGgwOSLetjegcE2saAE2ifMZ1
	GQner+W8FTzGhGq+1/Xed6BN74fLJEkjPoGsmsDXRkwQGlby/oDtlhlkMZyBpALcsHsPNuD3FOR
	DkV/xHHiyzHKpGTAut0yZWnw8t4sPnls8w5dkNwy+bw1knSlqZr+cTXTXWHHYmZb0a/Fa/pjPCQ
	nz+OvwWJKsh9+LrRx9ZLbp/2UEtevQ9wtnRJMad6KTi2xrxJ0Qtq/JLyg==
X-Received: by 2002:a17:90b:3a4b:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-39646308515mr1602252a91.1.1787595313785;
        Mon, 24 Aug 2026 11:15:13 -0700 (PDT)
Received: from manush ([2406:7400:94:a5e3:4d43:ded5:1c68:7d38])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860ef75esm26716169c88.7.2026.08.24.11.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 11:15:13 -0700 (PDT)
Message-ID: <6a8c8a31.ee10049a.195cf8.c6da@mx.google.com>
X-Mailer: git-send-email-equivalent-ps1
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: jassisinghbrar@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Markus.Elfring@web.de
Date: 24 Aug 2026 23:45:12 +0530
Subject: [PATCH v3] mailbox: mtk-cmdq: fix runtime PM usage counter leak in
 cmdq_mbox_flush
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_111515_271211_4548B1D0 
X-CRM114-Status: UNSURE (   9.20  )
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

cmdq_mbox_flush() calls pm_runtime_get_sync() and returns its err=
or=0D=0Acode directly on failure. Per Documentation/power/runtime=
_pm.rst,=0D=0Apm_runtime_get_sync() does not drop the usage count=
er on error, so the=0D=0Acaller is expected to release the refere=
nce itself. The early return=0D=0Ahere skipped that, leaking a ru=
ntime PM usage count on cmdq->mbox.dev=0D=0Aon every failed resum=
e. v2 fixed this by switching to=0D=0Apm_runtime_resume_and_get()=
, which performs the get-and-put=0D=0Ainternally on failure.=0D=0A=
=0D=0AMarkus Elfring additionally pointed out that the "out:" and=
 "wait:"=0D=0Alabels duplicate the same pm_runtime_mark_last_busy=
() +=0D=0Apm_runtime_put_autosuspend() + return sequence. That du=
plication=0D=0Ahides a second, separate leak: the "wait:" path's =
timeout branch=0D=0A(readl_poll_timeout_atomic() failing) returns=
 -EFAULT directly,=0D=0Awithout ever calling pm_runtime_mark_last=
_busy() /=0D=0Apm_runtime_put_autosuspend(), so the pm_runtime re=
ference taken at=0D=0Afunction entry is leaked on every polling t=
imeout too.=0D=0A=0D=0AFix both by merging the two exit sequences=
 into one common "out_pm:"=0D=0Alabel reached by both "out:" and =
"wait:", using "ret" to carry the=0D=0Areturn value. "ret" is exp=
licitly reset to 0 on both success paths=0D=0Abefore reaching "ou=
t_pm:", since pm_runtime_resume_and_get() can=0D=0Areturn a posit=
ive value (e.g. 1) on success, not just 0, and that=0D=0Astale va=
lue must not leak into the function's return value.=0D=0A=0D=0ASi=
gned-off-by: Manush Prajwal <manushprajwal555@gmail.com>=0D=0A---=
=0D=0Av3: Fix the pm_runtime leak on the "wait:" timeout path fou=
nd while=0D=0A    addressing Markus Elfring's duplicate-code comm=
ent, by merging=0D=0A    the "out:" and "wait:" exit sequences in=
to a single "out_pm:"=0D=0A    label. Add Matthias Brugger and An=
geloGioacchino Del Regno plus=0D=0A    the linux-mediatek and lin=
ux-arm-kernel lists to Cc, per=0D=0A    MAINTAINERS' "ARM/Mediate=
k SoC support" entry (matches any=0D=0A    drivers/mailbox/mtk-*.=
c filename), per Markus Elfring's review.=0D=0Av2: Use pm_runtime=
_resume_and_get() instead of pm_runtime_get_sync()=0D=0A    plus =
a manual pm_runtime_put_noidle() on the error path, per=0D=0A    =
Markus Elfring's review.=0D=0A=0D=0A drivers/mailbox/mtk-cmdq-mai=
lbox.c | 15 +++++++--------=0D=0A 1 file changed, 7 insertions(+)=
, 8 deletions(-)=0D=0A=0D=0Adiff --git a/drivers/mailbox/mtk-cmdq=
-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c=0D=0Aindex e523c8=
4b4..d4e5f6a7b 100644=0D=0A--- a/drivers/mailbox/mtk-cmdq-mailbox=
.c=0D=0A+++ b/drivers/mailbox/mtk-cmdq-mailbox.c=0D=0A@@ -565,7 +=
565,7 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsig=
ned long timeout)=0D=0A 	int ret;=0D=0A=0D=0A-	ret =3D pm_runtime=
_get_sync(cmdq->mbox.dev);=0D=0A+	ret =3D pm_runtime_resume_and_g=
et(cmdq->mbox.dev);=0D=0A 	if (ret < 0)=0D=0A 		return ret;=0D=0A=
=0D=0A@@ -590,22 +590,21 @@ static int cmdq_mbox_flush(struct mbo=
x_chan *chan, unsigned long timeout)=0D=0A 	cmdq_thread_disable(c=
mdq, thread);=0D=0A=0D=0A out:=0D=0A 	spin_unlock_irqrestore(&thr=
ead->chan->lock, flags);=0D=0A-	pm_runtime_mark_last_busy(cmdq->m=
box.dev);=0D=0A-	pm_runtime_put_autosuspend(cmdq->mbox.dev);=0D=0A=
-=0D=0A-	return 0;=0D=0A+	ret =3D 0;=0D=0A+	goto out_pm;=0D=0A=0D=0A=
 wait:=0D=0A 	cmdq_thread_resume(thread);=0D=0A 	spin_unlock_irqr=
estore(&thread->chan->lock, flags);=0D=0A+	ret =3D 0;=0D=0A 	if (=
readl_poll_timeout_atomic(thread->base + CMDQ_THR_ENABLE_TASK,=0D=0A=
 				      enable, enable =3D=3D 0, 1, timeout)) {=0D=0A 		dev_er=
r(cmdq->mbox.dev, "Fail to wait GCE thread 0x%x done\n",=0D=0A 		=
	(u32)(thread->base - cmdq->base));=0D=0A-=0D=0A-		return -EFAULT=
;=0D=0A+		ret =3D -EFAULT;=0D=0A 	}=0D=0A+=0D=0A+out_pm:=0D=0A 	p=
m_runtime_mark_last_busy(cmdq->mbox.dev);=0D=0A 	pm_runtime_put_a=
utosuspend(cmdq->mbox.dev);=0D=0A-	return 0;=0D=0A+	return ret;=0D=0A=
 }=0D=0A--=0D=0A2.46.2.windows.1


