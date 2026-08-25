Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA942C61DBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 17:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Date:Cc:To:From:MIME-Version:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=57hPk6B4v1KETwUArfZSnqqRqUE15uxO2Lfbtp7crWY=; b=pSSDRkvAaBILmPzqrem3Z+9dct
	XibbYkDOVxEi6pHzkqXBgKgEQyTmCraHvcJCtxgd76L2De2FAFLBUunZvqrSh+T2yiG0fT5PDmDkL
	oCjNyv105tU45GJwNF7Rk1Opt9rYCsegi0uZBGgtrCGnj5t333H2TUmIKCsBOyU177kQpHjH3nRDH
	0gs5EcMATwt7r5WAtMDIbGxaDkRKFpBo7HF4lOQzdJ7bwOSdM1Wn/+WnteMxQMgxc8l7PJP3pM57h
	2051ebr6cpjc8+UPkX4Gj02QMMJc5hg+rUmCfceiwPyZTPoqV4TOKt8vzacDPijmq/o1a9e74Pka2
	7wL03iSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyv2Y-00000001E2X-32Rc;
	Tue, 25 Aug 2026 17:34:26 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyv2W-00000001E1J-0Wh5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 17:34:25 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2d032846c95so1688765ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 10:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787679263; x=1788284063; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=57hPk6B4v1KETwUArfZSnqqRqUE15uxO2Lfbtp7crWY=;
        b=U+f2J4E8SwpcK/bUTwT08OIns/4i1/ZWnuwtOlc9+dzZc5QMr+jG3QGuSx2I7xttcH
         +S9RfhI3SZJOimOnfPHXQU9svIG6myX2p9XQekcvQb+l1V5xpRdqsvHJb3xCbHLDPELI
         47sOUyk4BI7W2BrwMkfFfBt7zQthOPPip3oWgELSY4wrJdcdhQr8wtE0tU0k6dVj9ynl
         83UosUbDSvFDIoWPsdHT4Hb97CLKamURKT45z04eJviS4BuqL0IRZMPoNOiYw0HYEGEp
         rtHDM7htt5NHpTA9puQzvC25oQhIIrsYUEP4n1jPso/SmYxZK27sV53AjFPqKsAXpGfK
         eovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787679263; x=1788284063;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=57hPk6B4v1KETwUArfZSnqqRqUE15uxO2Lfbtp7crWY=;
        b=qr68FoP3W+Atarlmg7SDUWgORTZAEFFOq9fLPlak2ny+aZoVpAYGxeJCvcbwxArWaF
         0vC095hila5P51kUyBZx+l+2y8QKXnDgg0IjC3YLAF5VNDmOK59ZdKVZ+DDxis3HbnCT
         yVxt9vHqULr3wk4e4sXgWKKhecRGtu+XBbWvRZYy7suSs6VLQzBBuFTWPZv5jXb71AnV
         pU4pwemXJ38ddL0TxEdWqD4OtDnsECSMNE/EN15HNzIbTLS3zFA7jJZXhB4He0UrAjSa
         i5UKeZq8gxp3iIU9/nS5RltnpCn4bb5ZnCjB6djkD1JJyAhY3tMZ/Q2TjFN5fzHlp2EE
         JIOQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/NG5mH/NeblInu7J0klc+dJ44iDnm3TuXuDFN9atqBuMDgAKp9dBZQ+8vVkfJU1d6p3wQWZcwuXmJ7uI+vQzm@lists.infradead.org
X-Gm-Message-State: AFuF++mH7RxKigji9ivH3EAKtK5kVc270fKN0Udwx7BQnOLgIQkR11Bm
	/btnfq0dTzoWMWabwr0oAqW5V5Ftgue5oRm/Bgv159FIn6+cCXuL6QEo
X-Gm-Gg: AR+sD12QUInZBKf3d1oMLaViniiOXslnDdAXiju+WPhjsPJ59mNU9hrtrqQaIMyZ8/d
	ODFdZwW0fELUkBS+cCgxdXTwnHN8LlLmG6Tpcf1wgaWVvjf/ohRo783MxH1yJ5O8jnTzWSSY05P
	4Mpp9bjzm7VFYOFfblgEaK3bW7TfRIvka1mXLhKaw7tZHkyQwUSD06QRabYRHurN/16jxJFU92Y
	sb8ywcrZG8FOgNQgtxZkaz9AMW8mOLecQ3XGrYcB4EyvonGIsYSy80zGB+dnfLUAOOmne0pfWxI
	EkYL3q5nOnlLFIzJqpf/aLHAIVb4HPLrDO/yVO+qLmd+MLCohCKvfqWnam13qoGiVrNN+S0rfy/
	iHJS0uTl7YiaRz9zEb01m557RDpBwuvK5oEkvb3QstFkzFJ/bW9FGEjicYKdpqQWQ2re+tqgCt6
	ZC3oGpn7QGKa78wgvBIZmDC8gl5570fhmX2ykDs28fvYMBqUrfiZiHs/71J4kvUiKEfk6no6Zkh
	RJ/SDOpeGGIrAykmmhBLVb2iQ+sh8pO309mVIQ5n5vXawB7gS08Gvi9ww==
X-Received: by 2002:a17:902:e949:b0:2d6:3c2f:6a5 with SMTP id d9443c01a7336-2d64b1d68bemr710709365ad.14.1787679262972;
        Tue, 25 Aug 2026 10:34:22 -0700 (PDT)
Received: from manush ([2406:7400:94:a5e3:4d43:ded5:1c68:7d38])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d884d5esm465303eec.17.2026.08.25.10.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 10:34:22 -0700 (PDT)
Message-ID: <6a8dd21e.b12cec6a.f9ff0.b637@mx.google.com>
X-Mailer: git-send-email-equivalent-ps1
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: jassisinghbrar@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Markus.Elfring@web.de
Date: 25 Aug 2026 23:04:22 +0530
Subject: [PATCH v4] mailbox: mtk-cmdq: fix runtime PM usage counter leak in
 cmdq_mbox_flush()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_103424_201384_EFB577F7 
X-CRM114-Status: GOOD (  12.10  )
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
lue must not leak into the function's return value.=0D=0A=0D=0AVe=
rified the merged exit path with a standalone model of the four=0D=0A=
possible outcomes (initial get failure, "out:" success, "wait:"=0D=0A=
success, "wait:" timeout): the runtime PM refcount returns to its=
=0D=0Astarting value and the return code is correct on every path=
.=0D=0A=0D=0ASigned-off-by: Manush Prajwal <manushprajwal555@gmai=
l.com>=0D=0A---=0D=0Av4:=0D=0A- Add parentheses to the function n=
ame in the summary phrase=0D=0A  (cmdq_mbox_flush -> cmdq_mbox_fl=
ush()), per Markus Elfring's review.=0D=0A=0D=0A- Reformat this c=
hangelog so each version identifier stands on its=0D=0A  own line=
 and blocks are separated by blank lines, per Markus=0D=0A  Elfri=
ng's review.=0D=0A=0D=0A- No functional change from v3. Still no =
Fixes tag: I don't have a=0D=0A  git history for this file availa=
ble in my current environment to=0D=0A  identify the commit that =
introduced this exit path with confidence,=0D=0A  and would rathe=
r leave the tag off than guess a SHA. Still happy to=0D=0A  add i=
t in a v5 if Markus or anyone else on Cc can point at the right=0D=0A=
  commit.=0D=0A=0D=0Av3:=0D=0A- Fix the pm_runtime leak on the "w=
ait:" timeout path found while=0D=0A  addressing Markus Elfring's=
 duplicate-code comment, by merging the=0D=0A  "out:" and "wait:"=
 exit sequences into a single "out_pm:" label.=0D=0A=0D=0A- Add M=
atthias Brugger and AngeloGioacchino Del Regno plus the=0D=0A  li=
nux-mediatek and linux-arm-kernel lists to Cc, per MAINTAINERS'=0D=0A=
  "ARM/Mediatek SoC support" entry (matches any drivers/mailbox/m=
tk-*.c=0D=0A  filename), per Markus Elfring's review.=0D=0A=0D=0A=
v2:=0D=0A- Use pm_runtime_resume_and_get() instead of pm_runtime_=
get_sync()=0D=0A  plus a manual pm_runtime_put_noidle() on the er=
ror path, per Markus=0D=0A  Elfring's review.=0D=0A=0D=0A drivers=
/mailbox/mtk-cmdq-mailbox.c | 15 +++++++--------=0D=0A 1 file cha=
nged, 7 insertions(+), 8 deletions(-)=0D=0A=0D=0Adiff --git a/dri=
vers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbo=
x.c=0D=0Aindex e523c84b4..d4e5f6a7b 100644=0D=0A--- a/drivers/mai=
lbox/mtk-cmdq-mailbox.c=0D=0A+++ b/drivers/mailbox/mtk-cmdq-mailb=
ox.c=0D=0A@@ -565,7 +565,7 @@ static int cmdq_mbox_flush(struct m=
box_chan *chan, unsigned long timeout)=0D=0A        int ret;=0D=0A=
=0D=0A-       ret =3D pm_runtime_get_sync(cmdq->mbox.dev);=0D=0A+=
       ret =3D pm_runtime_resume_and_get(cmdq->mbox.dev);=0D=0A  =
      if (ret < 0)=0D=0A                return ret;=0D=0A=0D=0A@@=
 -590,22 +590,21 @@ static int cmdq_mbox_flush(struct mbox_chan *=
chan, unsigned long timeout)=0D=0A        cmdq_thread_disable(cmd=
q, thread);=0D=0A=0D=0A out:=0D=0A        spin_unlock_irqrestore(=
&thread->chan->lock, flags);=0D=0A-       pm_runtime_mark_last_bu=
sy(cmdq->mbox.dev);=0D=0A-       pm_runtime_put_autosuspend(cmdq-=
>mbox.dev);=0D=0A-=0D=0A-       return 0;=0D=0A+       ret =3D 0;=
=0D=0A+       goto out_pm;=0D=0A=0D=0A wait:=0D=0A        cmdq_th=
read_resume(thread);=0D=0A        spin_unlock_irqrestore(&thread-=
>chan->lock, flags);=0D=0A+       ret =3D 0;=0D=0A        if (rea=
dl_poll_timeout_atomic(thread->base + CMDQ_THR_ENABLE_TASK,=0D=0A=
                                      enable, enable =3D=3D 0, 1,=
 timeout)) {=0D=0A                dev_err(cmdq->mbox.dev, "Fail t=
o wait GCE thread 0x%x done\n",=0D=0A                        (u32=
)(thread->base - cmdq->base));=0D=0A-=0D=0A-               return=
 -EFAULT;=0D=0A+               ret =3D -EFAULT;=0D=0A        }=0D=0A=
+=0D=0A+out_pm:=0D=0A        pm_runtime_mark_last_busy(cmdq->mbox=
.dev);=0D=0A        pm_runtime_put_autosuspend(cmdq->mbox.dev);=0D=0A=
-       return 0;=0D=0A+       return ret;=0D=0A }=0D=0A--=0D=0A2=
.46.2.windows.1


