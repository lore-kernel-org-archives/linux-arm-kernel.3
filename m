Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276A3FCB63B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HTUyjzWQlmyWS8msqiZFIPsGR/mo7nkJ7d7d2h1vFSM=; b=zDlaKEYHCOUuuXcy4kWeSATccA
	+BC5SXqP6Rg0eU1b5siwfP+v6RW8unYd8qHnAkklKNeTcX02eIjLjrQBE/9uTpX3h5Gdz1x8it2s0
	rfVr4lVpCO7UAR0B+PYGcEIt7fVMtzKvvIRtGZWQXSLvqsqlU8G5hy1PYTq9BE/FJ7Q9sMRHlKjNo
	XDLzj0BGb2VCa6vRKBTR5T59vjLBlmAHdk024wPfF39Now3OAR1BEHcfteFYyczuPVfy5EAX7rLZd
	3PrRyz53DoR7yn7+8u4ismfnUd3ANEco3ZKW1fF247mtNHuM3PB/0yTYlmnBv0Y+oUbaQNKt4GvgL
	YG/knMgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYjn-00000004FYc-1rSU;
	Fri, 06 Mar 2026 17:13:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYjj-00000004FWg-2ZTI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772817193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HTUyjzWQlmyWS8msqiZFIPsGR/mo7nkJ7d7d2h1vFSM=;
	b=VwwMuUhLcLGBHUyyQw5l8dk+x6hhxEYguoJRx9XNsUHzrKlkWB77vqA2XxS+58IbZDKjra
	aaTokg8O94xJWhtmzpNhOiHM7X1o6rp0pZ2xJLzdSp2dVdVJrJX4FS6FGFjOt63bkVRJzw
	AZeAUWE5KgBvhMPfp72WA45q/fEP5p4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-52-VJAyFxjXMeCPhW5M4IrPzg-1; Fri,
 06 Mar 2026 12:13:12 -0500
X-MC-Unique: VJAyFxjXMeCPhW5M4IrPzg-1
X-Mimecast-MFC-AGG-ID: VJAyFxjXMeCPhW5M4IrPzg_1772817191
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 861371956089;
	Fri,  6 Mar 2026 17:13:10 +0000 (UTC)
Received: from [172.20.96.208] (unknown [10.30.44.37])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3E6A7180035F;
	Fri,  6 Mar 2026 17:13:09 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (7.0.0-rc2,
 upstream-arm-next, 1e0a8362)
Date: Fri, 06 Mar 2026 17:13:09 -0000
To: will@kernel.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <36947.126030612131200335@us-mta-52.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zLAhbtkdSyXvGApli2ZmuXfYm4DI4idYMdghau34El4_1772817191
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_091315_726948_F953A362 
X-CRM114-Status: UNSURE (   5.97  )
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

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge branches 'for-next/core' and 'for-next/fixes' int=
o for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2368596381

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: fedora: avc:  denied  { create } for  pid=3D1 comm=3D"system=
d" name=3D"io.systemd.Hostname" scontext=3Dsystem_u:system_r:init_t:s0 tcon=
text=3Dsystem_u:object_r:var_run_t:s0 tclass=3Dlnk_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2443788
            Affected tests:
                Boot test [aarch64]
                Reboot test [aarch64]
        Issue: [upstream] Hardware - Firmware test suite - auto-waive failu=
res
            URL: https://gitlab.com/cki-project/infrastructure/-/issues/779
            Affected tests:
                Hardware - Firmware test suite [aarch64]



If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___


