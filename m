Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7035C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 12:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMW8k1nI/dgdeyw/NhQxjX7qpdqP40lF9jKMaJt7+LQ=; b=Z9fy6oxnx6xbQ4jwLL6Zxe+9iL
	2PT3QYDnsORLUQdZJnluKLK3RxWqLzzgkyZauf8+3TP8BgFSHXGdwaRH0Y5E8v42Lgk1xzKYpCkRW
	oBrzL013XGhbAFsoLoHEmOJjflBTmD0Mg45gjmvT/UKldMpR5mzK89c6w1iHvTJyxyr6/B2E71aWI
	w8Di9HCnmcIyu/TSIZI/rBfiBMVSK6z+vNtMSiDQTsd8rDk/IrHQaNnj0EaYFKlxyB2aAjfNuNVhI
	bHMCeRuM4ulj7ED14LMfGs1pASIuxEqgztS6L7pEl37Zs1jSQ1c+GqBqp4XSai4p8MO5tzdhXbmq7
	MlDPF7wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trGA5-00000000Wxz-0f9G;
	Sun, 09 Mar 2025 12:53:45 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trG6q-00000000Wgp-2stb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 12:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1741524621; x=1742129421; i=wahrenst@gmx.net;
	bh=IMW8k1nI/dgdeyw/NhQxjX7qpdqP40lF9jKMaJt7+LQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=e+2Rs/vs826tmnRSYrKLREDD0tzr6jmZn6C/Tl5vmJ5hS6VDIfG6qo0loofWFhfu
	 kYnqgWp5WSArpyOBCzWaw6HPTgdv5FXVhCETeY1aO6rMSYnPXYEEyXaoxLdEOw05S
	 xYGRKSlzYRh/TIPc1J8NhFaGGTFWW1LHQCY69whNxGzN8hgL2Xo3GbYvsgr3dH7Xq
	 efYw4LDLCMHv7DRt6UXW6JYQdAsa/m/92Uaron0w6sCIRI7r1N5qWuS7DdtB/ew60
	 X7c7De174IvT6H6PYW58+SIGvANfieLCOd5UAnf7wT1agf1DN61o72mPVqLZt531K
	 lnzowSawyZsUcIvJUA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3DJv-1tnfjk1M33-006KOF; Sun, 09
 Mar 2025 13:50:21 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 4/5] staging: vchiq_arm: Create keep-alive thread during probe
Date: Sun,  9 Mar 2025 13:50:13 +0100
Message-Id: <20250309125014.37166-5-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250309125014.37166-1-wahrenst@gmx.net>
References: <20250309125014.37166-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HDJIk4tIYimiHZF2NbRm3BtZemIDLp0JOg4FIVzSC6KtMikw2vO
 0TP7V3zvpHqzTgADwMeKP3UOL5EScw71WbOQC414qhyaRRmwBjd8HUFJ16FaCOOlGf3Nx2l
 1+1sdgH5J34onXnDDo4vaZb8Vq+4a1VXl5pLtD7wQ/hfvwf1J07eGThvNgLNrN/EQI64tZL
 p0ebEoop8muR6dZgCYHlw==
UI-OutboundReport: notjunk:1;M01:P0:w1NyaykYv84=;FgHtxjabk8vWDmPUJrKgoUclf79
 HKvO8paN/ErWQyyWsPQf237qn+MXko9sPUqN0Jk92ZHLLhHbwggKwDMi65TJjSCbIo5GutbSH
 grhwqAdILYWLdbuKZxaXcdJsb3xSddHzejR9gl4Ql6L4RCffWiYcYs3XMs+Fe1V9zaR3aEsg7
 +YHoxEA1ivSU9eeca5h2VCizRT8NhhGbjwmVpww59cTR14hryT1gmbURpIatWCOpaS7aDvXZG
 mNhKl6aIlXkhfVKCJRuxByk39UAUlq+914oK41V/tezjvFLfLVizaZynTlVXIqxrK9AKnQ80m
 AqVjO0m1FPrlDXqVhsNUJje2NS3cxwJlG/+25anRLOjMOh0XVRc1DSXROrmT7X2tnsjN8QkR6
 Lmvd66msgP7B72pfwK/3j5p/dSm+g1IT/qraU5eWKonBgLUX/Qm2HNrlpJbGBHfrwmB4BH3xt
 lhE34c/uzmIDGkN9ec+8PJCh5WHAaBKB4VwF8iZu+vx64cBjR2TfKvZkMZfEHvcgfM7x6dIbI
 jL/4s7bbjidIOyiYdnLt5MoAG22LF5JGKEnXsF7DAH7RK81redQsytIfMa/ilkuua7u44G7PT
 sHmqinfbmiRq8B2on1XRoe+gXXcAv0+IfecvbVW10w+SKLVfBDOTeXgbrc5YOOTJrNGX4lzx5
 jnN8j3cxEKO3bWvgVt26dFTl8bqkbanlxMZnD7RYZSsclM9WOPEXDe0dHwvlqa/ybIKVEF6PE
 D4WSb/3XcCVrfcuWuFyKjNVEEsWC8mdLtlJjXO02Rl1ukQ8Jxv4ncJ+P8FLx+YcmPNCQpKkvR
 bJtiSzyopD8dbk2ADh2HfRyTfSdH8cSdzqoV6wYQKOMD4qPV8YWXcu/G7fG0+5Ya2KB9Nh+72
 FdDKoLgXsFqznz6LVipoW23ipHKBRAgqX1qmKxxwkL7+yiU1FpcuLNz67Bc+okP3MDrujqiyE
 pPp8vF7Q+6iR4DV0RgNwZbv1++VPCeAWOjzBHv76ZNyJNuRqpMFY6+RvxbFZFpxSKkounpCH1
 ivO6/GWX5r1UtopyKk0u3VMf7kCFm55u40WlXJN1YHfGiSK08JuSW0HpQtr9bLgcJPuL7UyD1
 1O3HURrf9Ig3alfbH9p80mPWhsfNJXo6gQmJ9IxBpWFlFUft0OSNBkLvkOm6t0K5l2I8Jflg1
 nSgy70NWJhiL5J2peq4GFcO2uBE53xOkzqem/ui8AGTSB+//Y75IXyR7VVoc/7Rwmq3R2AFhv
 2cVnGr3sgB8B7MBFmBkVW16rFUcDBv4xMXTODESxTe1EMo1mGcBN/s5lb7jLR5TqbwgoLi3T1
 iYnY6bZCMMI6udnqhpr4SRCRJLUjpeFrv+/dnDDeKKHtaOwM21R6eHes8F2qZUYGn0U2OWHi+
 or0/84wUZKfzTcMtGzLem0yc+R+d2dYmK9B90XLzG3OjvFxHfXYNKID59T
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_055025_024395_0EE00153 
X-CRM114-Status: GOOD (  11.95  )
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

Creating the keep-alive thread in vchiq_platform_init_state have
the following advantages:
- abort driver probe if kthread_create fails (more consistent behavior)
- make resource release process easier

Since vchiq_keepalive_thread_func is defined below
vchiq_platform_init_state, the latter must be moved.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../interface/vchiq_arm/vchiq_arm.c           | 69 +++++++++----------
 1 file changed, 34 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 0c7ea2d0ee85..64f9536f1232 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -280,29 +280,6 @@ static int vchiq_platform_init(struct platform_device=
 *pdev, struct vchiq_state
 	return 0;
 }

-int
-vchiq_platform_init_state(struct vchiq_state *state)
-{
-	struct vchiq_arm_state *platform_state;
-
-	platform_state =3D devm_kzalloc(state->dev, sizeof(*platform_state), GFP=
_KERNEL);
-	if (!platform_state)
-		return -ENOMEM;
-
-	rwlock_init(&platform_state->susp_res_lock);
-
-	init_completion(&platform_state->ka_evt);
-	atomic_set(&platform_state->ka_use_count, 0);
-	atomic_set(&platform_state->ka_use_ack_count, 0);
-	atomic_set(&platform_state->ka_release_count, 0);
-
-	platform_state->state =3D state;
-
-	state->platform_state =3D (struct opaque_platform_state *)platform_state=
;
-
-	return 0;
-}
-
 static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct vchiq_=
state *state)
 {
 	return (struct vchiq_arm_state *)state->platform_state;
@@ -1011,6 +988,39 @@ vchiq_keepalive_thread_func(void *v)
 	return 0;
 }

+int
+vchiq_platform_init_state(struct vchiq_state *state)
+{
+	struct vchiq_arm_state *platform_state;
+	char threadname[16];
+
+	platform_state =3D devm_kzalloc(state->dev, sizeof(*platform_state), GFP=
_KERNEL);
+	if (!platform_state)
+		return -ENOMEM;
+
+	snprintf(threadname, sizeof(threadname), "vchiq-keep/%d",
+		 state->id);
+	platform_state->ka_thread =3D kthread_create(&vchiq_keepalive_thread_fun=
c,
+						   (void *)state, threadname);
+	if (IS_ERR(platform_state->ka_thread)) {
+		dev_err(state->dev, "couldn't create thread %s\n", threadname);
+		return PTR_ERR(platform_state->ka_thread);
+	}
+
+	rwlock_init(&platform_state->susp_res_lock);
+
+	init_completion(&platform_state->ka_evt);
+	atomic_set(&platform_state->ka_use_count, 0);
+	atomic_set(&platform_state->ka_use_ack_count, 0);
+	atomic_set(&platform_state->ka_release_count, 0);
+
+	platform_state->state =3D state;
+
+	state->platform_state =3D (struct opaque_platform_state *)platform_state=
;
+
+	return 0;
+}
+
 int
 vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *servi=
ce,
 		   enum USE_TYPE_E use_type)
@@ -1331,7 +1341,6 @@ void vchiq_platform_conn_state_changed(struct vchiq_=
state *state,
 				       enum vchiq_connstate newstate)
 {
 	struct vchiq_arm_state *arm_state =3D vchiq_platform_get_arm_state(state=
);
-	char threadname[16];

 	dev_dbg(state->dev, "suspend: %d: %s->%s\n",
 		state->id, get_conn_state_name(oldstate), get_conn_state_name(newstate)=
);
@@ -1346,17 +1355,7 @@ void vchiq_platform_conn_state_changed(struct vchiq=
_state *state,

 	arm_state->first_connect =3D 1;
 	write_unlock_bh(&arm_state->susp_res_lock);
-	snprintf(threadname, sizeof(threadname), "vchiq-keep/%d",
-		 state->id);
-	arm_state->ka_thread =3D kthread_create(&vchiq_keepalive_thread_func,
-					      (void *)state,
-					      threadname);
-	if (IS_ERR(arm_state->ka_thread)) {
-		dev_err(state->dev, "suspend: Couldn't create thread %s\n",
-			threadname);
-	} else {
-		wake_up_process(arm_state->ka_thread);
-	}
+	wake_up_process(arm_state->ka_thread);
 }

 static const struct of_device_id vchiq_of_match[] =3D {
=2D-
2.34.1


