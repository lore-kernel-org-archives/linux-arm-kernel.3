Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA77C5DF93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 15:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Date:Cc:To:From:MIME-Version:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6Bsx8BJCtyIr420sn6UOmmfUpk/4wGiO3QmZgK+BTK8=; b=P91byYCNhee7mTK9CssuzQMcRs
	s/86xZ3Oy9gUrnnDZiF6NKjgwLDiN9I2THFSYdRkLPc4+sIe77/xnnUQ1zbSw8BTUtveTkgkdUsIo
	xp7JvjiyzAfiRAANaZVNkRq3N2wgeY5RcGNJLj6GNFjxEWYwznlzV3nCrctGCPIhfChlBUe4CptS5
	gvWrcmjsVpaXGplunZamjbhaqfOL1REOgD19dqtH7sgotJhAyfxyadXCM/GqBxQgASTXB1xiAPgrB
	lX3MhdFfRQdoXGo76pculrojekZE83W68JPCrlR3LAeMwks5wr16gTbkTbHDVHl95V5XAQ4/7n9OQ
	CYse/LwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRcD-0000000Djak-0JiP;
	Fri, 21 Aug 2026 15:57:09 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRcA-0000000DjZp-3BHU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 15:57:08 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-451d8064238so1100222fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 08:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787327825; x=1787932625; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Bsx8BJCtyIr420sn6UOmmfUpk/4wGiO3QmZgK+BTK8=;
        b=lEjSZudZ1/F1X+OBrcuNjddqv+LtrzuQgQeIGJvhVK/flYbeganMPL+flgjNGWwvkL
         ulyYDto9h4AealFJdh0ZQTLdh3k4NPjDf4Ik8w0ORsUDoMDsM5yjqLwSsJoXHdMvQpEZ
         1oJWK21TG4OLinacBAeuU8SYYOy39OqCo+gJXqz9YtN91J2sMPOPZZRg8UYkLtkxBQFf
         p5SO2eH+jkg5GsR1mB6bIilgePrEigAfUFIVTYceRlVuD70jWs8Gk+vYvz+YuVRk2FFH
         Ig+tX3F4AIKUF2TBiwR+RSeuqOI1ko7C6I2Nvsny0TQwU7Fpw7OwX33HdkZL3ARpVZuc
         jaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787327825; x=1787932625;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6Bsx8BJCtyIr420sn6UOmmfUpk/4wGiO3QmZgK+BTK8=;
        b=NkLL/RkVKNNUyXEMRba9d7A/8OlmKgx3CcDKuONJQlC6j5NJ05yp098TPIUAAb45eP
         IQZW1QYGksTzWrQWt2p5sNKhx+bPltVn1M5o0J/nzG/r9JQziFGrXJgU/AJKGcF8rhfc
         rdkCNkc3bnXIasFerok1+DnyOjXfeejwelmKY4nKTfNc7lRz1+OhpmZOySnYYbRVpMSQ
         De39bxcD9UB1y/fHBvWI9KyyEkMBlUDFqJ3nFSSZQDk3ewfPk4UM+mKwD5ShYZcCb7e9
         BwDQvNKx17LCJY+kk66c7WEVWDZ/WwFuUX4Z/qfUCUMpCIuDaCwrsCbw8rygteNIYUlb
         LbHQ==
X-Gm-Message-State: AFuF++kNvZsnQAZXsmImPZ1b7rwy2WW27orMHDFyQTpojSxrZ8DzTygz
	rd/gdoqN0I7UzVhOKi7rEVae93OcbJDJkzW4/wCtzJ1eWRbcVB6QOYcX
X-Gm-Gg: AR+sD13JfSJj9vWZYm9ilrFw5/kxj10ZYAhUZ20jn/t4CCihGnOUurzSHeXDxhJ6RW8
	8FLWgtbb+rl7ZekdjBlFIioXrmLpX6wLREaefKzoSp/l6wdBVaVQJ8wxIYE6cn6XJGnEL2fHwD0
	umRKfsguB0KaDmthyslbMbIFlN+mAs+DkViLEr+2IjDFNB691Vc47Rq+G8AmR/znMaxDOgm1fgA
	m7E1IMuoPrANUpFUMLohJPxMwNjUWI14gBmGlro0v9qEAR+GMfH+oqDG/qKwafNEVADQoshinZi
	duD1Gg5gY+gI1IojnvzUAa6vbhtOUw1MSEdTVp0eUuNi41ke7GFrU9JLvcvP6qyTuXYN+PJz2hN
	jFGSZzLhqhrKKG992wXSf5Qo2AUI6efVlI1bRLxI4HgMY6Q/CR5Pu4EIu1EVljgLjc074ElwEi/
	68Np/tA0B/bAfY1XgNxLrbFalrFgP0S6gweZ/cQe34F+GOX0PpFM4cmtbfkRLw7Qi/Lcf+4ONH3
	0lvUAMubTJdbZrRoGTh+kQXSFkaFRQ4cdIf49NMIfvuGJwY7cdFQGTo
X-Received: by 2002:a05:6870:a548:b0:439:a524:a29d with SMTP id 586e51a60fabf-46350f39b89mr7242085fac.1.1787327825031;
        Fri, 21 Aug 2026 08:57:05 -0700 (PDT)
Received: from manush ([2406:7400:94:f2e0:60f7:d7e:950f:50ce])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4632a54fe9fsm4875176fac.1.2026.08.21.08.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:57:04 -0700 (PDT)
Message-ID: <6a887550.f7f62383.10ed1b.5875@mx.google.com>
X-Mailer: git-send-email-equivalent-ps1
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: lorenzo.pieralisi@arm.com, robin.murphy@arm.com
Cc: linux-arm-kernel@lists.infradead.org
Date: 21 Aug 2026 21:27:04 +0530
Subject: [PATCH] bus: arm-cci: fix device_node refcount leak in
 cci_probe_ports()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_085706_797353_A29D2989 
X-CRM114-Status: UNSURE (   8.70  )
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

cci_probe_ports() has two device_node refcount bugs in its=0D=0Af=
or_each_available_child_of_node() loop over "cp":=0D=0A=0D=0A - W=
hen the computed port index "i" reaches nb_cci_ports, the loop=0D=0A=
   breaks out without releasing the reference the iterator was=0D=0A=
   holding on "cp", leaking it.=0D=0A=0D=0A - When a port is succ=
essfully parsed, "cp" is stored into=0D=0A   ports[i].dn for late=
r use, but the loop keeps iterating afterwards.=0D=0A   The next =
for_each_available_child_of_node() step puts the=0D=0A   referenc=
e on the previous "cp" to advance to the next sibling, so=0D=0A  =
 the pointer saved in ports[i].dn is left referencing a node whos=
e=0D=0A   reference was already dropped.=0D=0A=0D=0ARework the lo=
op around for_each_available_child_of_node_scoped()=0D=0Aso the i=
terator's reference is dropped automatically on every exit=0D=0Ap=
ath, including the early break. Since a matched node is kept aliv=
e=0D=0Ain ports[i].dn past the end of the loop, take an explicit =
reference=0D=0Awith of_node_get() when storing it.=0D=0A=0D=0ASig=
ned-off-by: Manush Prajwal <manushprajwal555@gmail.com>=0D=0A---=0D=0A=
 drivers/bus/arm-cci.c | 6 ++----=0D=0A 1 file changed, 2 inserti=
ons(+), 4 deletions(-)=0D=0A=0D=0Adiff --git a/drivers/bus/arm-cc=
i.c b/drivers/bus/arm-cci.c=0D=0Aindex 000000000..000000000 10064=
4=0D=0A--- a/drivers/bus/arm-cci.c=0D=0A+++ b/drivers/bus/arm-cci=
.c=0D=0A@@ -438,8 +438,7 @@=0D=0A static int cci_probe_ports(stru=
ct device_node *np)=0D=0A {=0D=0A 	struct cci_nb_ports const *cci=
_config;=0D=0A 	int ret, i, nb_ace =3D 0, nb_ace_lite =3D 0;=0D=0A=
-	struct device_node *cp;=0D=0A 	struct resource res;=0D=0A 	cons=
t char *match_str;=0D=0A 	bool is_ace;=0D=0A@@ -455,7 +455,7 @@ s=
tatic int cci_probe_ports(struct device_node *np)=0D=0A 	if (!por=
ts)=0D=0A 		return -ENOMEM;=0D=0A=0D=0A-	for_each_available_child=
_of_node(np, cp) {=0D=0A+	for_each_available_child_of_node_scoped=
(np, cp) {=0D=0A 		if (!of_match_node(arm_cci_ctrl_if_matches, cp=
))=0D=0A 			continue;=0D=0A=0D=0A@@ -498,7 +498,7 @@ static int c=
ci_probe_ports(struct device_node *np)=0D=0A 			ports[i].type =3D=
 ACE_LITE_PORT;=0D=0A 			++nb_ace_lite;=0D=0A 		}=0D=0A-		ports[i=
].dn =3D cp;=0D=0A+		ports[i].dn =3D of_node_get(cp);=0D=0A 	}=0D=0A=
=0D=0A 	/*=0D=0A--=0D=0A2.46.2.windows.1


