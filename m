Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BC7D32D93
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 19:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NbgawJ1pxoljPCAhqZapGOqysLwp/QLfLx0jDVb/9KI=; b=lonGhI5rGz//GRVKH/0NmdJXDi
	1RN5dKUu2xOpwKFj+2qpFPXC4haNOFGdIBJAXfLoO2vInzMZrRQGP5YiPgMg76/YcOQilBl+nW00+
	NM9Nf3CtzM7Awlyokgui6MNEEFwC2eDc3AM7tXcJH2ekVqbitd9zWcrqW9uCZIYJL5BxrXaGj7yn0
	qjA0HvKRcpn4zxCcrlqDkjJOwm0x33UpJKw1LBu6Icl5rJL2+uu3CwJUzGqIXchcuIjVFbY4IGoHQ
	Sm26rYEmJ5Km0YCz21+Zp8bmU1vT/fN4XQKTPTkH2mlTap6MIxhosP0RQFKEL3WrzkZGWQiQQcH8H
	YMYAp2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAwMD-00000004g1J-1VXj;
	Tue, 12 Nov 2024 19:15:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAwK9-00000004fnB-3gGf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 19:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731438791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NbgawJ1pxoljPCAhqZapGOqysLwp/QLfLx0jDVb/9KI=;
	b=MVG+cDtLC55Ghuqq/JbGKowwDCeDA5NMRokRWU291UnBlLCrzbt9KKlRU62qWW1pG9kNUR
	ES5AxpjEtG5H+6h+Hv1wLRMOjRquSyckNVv7KZVIOC2Gyqis4ogamrVE1TnfRs/UWZkkxF
	fj8M9gyG7CrYd+FvL9FyNzHTX0z+JZc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-637-zSGczWxgOIm0vvVQfk--DQ-1; Tue,
 12 Nov 2024 14:13:08 -0500
X-MC-Unique: zSGczWxgOIm0vvVQfk--DQ-1
X-Mimecast-MFC-AGG-ID: zSGczWxgOIm0vvVQfk--DQ
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C80E419560AE;
	Tue, 12 Nov 2024 19:13:06 +0000 (UTC)
Received: from [172.64.11.46] (unknown [10.30.34.132])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 058DA19560A3;
	Tue, 12 Nov 2024 19:13:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (6.12.0-rc7,
 upstream-arm-next, a2995abc)
Date: Tue, 12 Nov 2024 19:13:05 -0000
To: bgoncalv@redhat.com, will@kernel.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <60391.124111214130802457@us-mta-637.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JBWU25-DoEVsPUJamoaABPLlnfJrCySUsAxDF7al1-k_1731438787
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_111314_014293_FFAFFEE6 
X-CRM114-Status: UNSURE (   6.78  )
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

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge remote-tracking branch 'tip/irq/core' into for-ke=
rnelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1538661334

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1538661334-aarch64-kernel_upt_4
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1538661334-aarch64-kernel_upt_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check



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


