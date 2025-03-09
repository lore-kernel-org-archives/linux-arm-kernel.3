Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602F8C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 12:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pLb8CZ/yCsK0onb7oAbrJ7xNsSeNVG+Pj2jfFRdvfzU=; b=tNr6I9ppjdIsoN4WoEB0/7yFzI
	p4o1Ic/GTfKngSC9cEvD6HI/c44AlKOuePOraKDvmacL4M1sB355jWoQ6sZMD38NtpvI8cAm+5GHI
	iaNjc151c1+yxEVURaRKlliV5B/S93uT1xaFMHyZ1ZUbPZmXuN77/zOBFk6jUTaAH7MOv7uyQUkxu
	Qzd7yl1r8N4d3QjtOWHqvKWFkYgiEgKxZmS5H/yES8nxc8RhO7qguiu4+eQRbb5cs6qGfnskIt1r4
	+OhB0KRTEfcvkHs9/VQn6jdgTDaFCF6CqZiHPSHCQBYVK7JuNCLNUVherzt3cSDN6hckVCYL/VJnf
	kk0aHrjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trG8T-00000000WoF-2EJu;
	Sun, 09 Mar 2025 12:52:05 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trG6q-00000000Wgh-1wHs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 12:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1741524619; x=1742129419; i=wahrenst@gmx.net;
	bh=pLb8CZ/yCsK0onb7oAbrJ7xNsSeNVG+Pj2jfFRdvfzU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lRZrm5Ad2wIVbJ2AsuDrIws9O0ImNKSytWYRRFa4knclT5E/jCqmRL9q9sK58O+g
	 O6rIeoGUFAmry2McYuo+lNZvqNuxran+O7xEGQm67Nn17bdp8AsC9crHirEYL/5cH
	 fTZMOh2SM03Yuar1zcAtULSOfIYkBjEKbLJ0YZZzX3zXNskX42l8VDGgUE8Ay+iE/
	 RKRHw5eyfOVhaoqVMcBSnQb4kFGIDye8a3fOFJLzcXW86uRXqTS9/5pi7XGkO6ObV
	 +8ZI4fE6DTtqWurj8/MPI8BkhcHKSXTk9vRyx0EpHTBO6yN7jtdOnAjBj2oixtv2p
	 TaqiCSvFx10SVmPbQw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2f5Z-1toDhc1UyN-005m9t; Sun, 09
 Mar 2025 13:50:19 +0100
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
Subject: [PATCH 0/5] staging: vchiq_arm: Fix & improve resource handling
Date: Sun,  9 Mar 2025 13:50:09 +0100
Message-Id: <20250309125014.37166-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p8fIGmiRZLax356bRabe21HXoRTe+69EeTlX8M64FZeUd+wEvWl
 PbgAZgqjeGm/iH9srgb0KpZe0mOT89WCOlhr7whqfUwfY2ND/E5Cz6y8acfN9cefza7/86Z
 MfLX+LQwHB1wTgyukvfablyRn1AdWwZ5QdMAaykery3EY6RvqAW9IJ1xNzQwQteDEdbOAr2
 yaq8lG+YNMqKEmYy+sc0A==
UI-OutboundReport: notjunk:1;M01:P0:Xfq5icII74M=;VQaZ/ysS41AIf8FtPNB9BlP1pCy
 9/C88lHgIXDYuPBtONFwacPDZvNlJyEoAEpgUIdbIqsCSLiS4sOaxOdNwccLD+4ptFdk+3jl/
 uwN5Qvvy8HrWXnL1yhJFUs65gFk7fUkznD4YJ6p92xjX3aAabEXV5NearXIbyAtSzn15PgHKM
 n2z3XfmUG/texm4aXSsv+jhA/iOfRQA89hnP7kgPVIp8AIFpyG+uIL5EYsuoqVUBXEL9992gJ
 xCd9NtRAgv4Ppd5Dmyx6CAqqsKD432vfsOxsQxrUWVff5YqXQ0JhkkxZtYxF6lC/CBIcAfwW9
 qL7LJjBaREkt+CR+XX5Zeql2tq9glNOJ9yzNCzvPIO7z7D/jo+X5HvaZN39cSh4dC93n7k13L
 jczUYMIGAuEd0TBnHQJdoSPx+DsDdquMuumqvcbola5bRGFzMgHnTbZOv+Wt9BHcycz2FSnzd
 V5g8CN1nXxmn3cHGn9oUq/SxIxtG7/oUAt5mfuSoY3OpeKWpJFCkqUKUfGnbcnlECbo1Jyv1E
 I1yIKqtwSZ5ofIhQxqysg143H7tcMwXgK6kRLxobXtIQscbLMN/I5XmoXs/fotzZPA1IQCTs5
 UU2GzDVfz7h5yGGRk2UkLswIGenmVs2YutURmgMkR3OagzXaYdRBmJr9eAddX2wrKFlELUn78
 SQ3J12kKgfFkyXeXe6ebgzvQT8OFo/vm88UtwYtmCLvL8VO4MmMOX/do4Dnk0CRVq9z0Ve22w
 SyOS6L9oRXnqifij4grVm3AJH9cIGKnwT3ClW9DOb83CrjargqP49fsXGdYtA8sH8J+ke/sIQ
 YQthucr2kTeE0uo8CeLAX4HfXbSgahvIyJbGFP3MBMpF8Dkp85ftvCAQOjIxSaTHD5/7duapB
 ugqmTrlsP3hLR+YBmCHOGMFm7pp4m05Ox7+BFclasygvys5hgn6943kAb7z3WknItybzO+czG
 RF65wr6BUPM76uOPo2QLC0JCAdiJTGNSxwA1Dj0vUShcLgUMwdjspFZyKVB5bwmFG0ebaFXcV
 gfnkrVUS3HUhynAwn/CnYOueW5zLUU5Th7OzhWvz/CFfG1e4BAIMBC3NVarulphiK6g3VPyuE
 smesFTBz1OLtttMryREv3JTZc+moUhDhD0jGSSfUZqdjxa2VZY8eTk4LTuq7cNPyTjqV63tYI
 fJUpueI6UTatnOZ58thvgP5tyDE5CkmgpX3hZBKG6jrxzzHtYIETT6MbqNqtso8Qtne2Omlau
 4mthf/S/hsllDpeYffsC5p0vbtv6EoLnyD/AK8lhgJ37G9iDRmEroXpq0qfciAYlRj3wj//wW
 UdivT1ZGdVUgnjboLwoCuSGilNy65W5trO1UD9fIKi8TXeBChd4Nhe9qRzvdCnP0JUyOdxsTD
 JEmyPO8tKkD+uKyI4zPydJwszWRsX+x599AGPF9rjjn+EEYyk+4aBoFNcT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_055024_889716_5A46257B 
X-CRM114-Status: UNSURE (   7.31  )
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

VCHIQ driver probe und remove have some resource release issues regarding
kthread and debugfs handling.

Stefan Wahren (5):
  staging: vchiq_arm: Register debugfs after cdev
  staging: vchiq_arm: Fix possible NPR of keep-alive thread
  staging: vchiq_arm: Stop kthreads if vchiq cdev register fails
  staging: vchiq_arm: Create keep-alive thread during probe
  staging: vchiq_arm: Improve initial VCHIQ connect

 .../interface/vchiq_arm/vchiq_arm.c           | 121 +++++++++---------
 .../interface/vchiq_arm/vchiq_core.c          |   1 +
 .../interface/vchiq_arm/vchiq_core.h          |   2 +
 3 files changed, 60 insertions(+), 64 deletions(-)

=2D-
2.34.1


