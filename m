Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6226FE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 23:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4E7jBNp0Z4DmohlZUwrFamIlelIAm3Vyor6psz5iwaE=; b=a9z4D/mt+94oUxhYFeYUASfviG
	KXUjG8t7pZrvNjhrz5oVQk11IRhDt0hdqGhKLiVQqYM9aGzBi5QqCJ250YgBUGQBeSiyt2/0yqXtn
	YduBqDU8aFefN/m38cm4DlxBq1N9GZJBU1MYxdTPtp2AnQKBtBSI/zQinVMtBdyVxOYMztiyAzOUT
	1ORilXhTZV4b/zhSFmnFMS+C6efm0ERGvWbcbwZntQzFjtk7r7en5tZuxM4cCONIi0mexpMALkRvc
	XzNwSDVYkLqBIPw0rg+1GUgokTIduMJzbbhUDJvdpG1HnOcg1A3foX6t8P8slLPxyFVPuRa2rPdy6
	vMQKFAJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOPht-00000003KZ0-4BcC;
	Thu, 19 Dec 2024 23:13:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOPgl-00000003KRY-3B0h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 23:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734649933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4E7jBNp0Z4DmohlZUwrFamIlelIAm3Vyor6psz5iwaE=;
	b=gJDqQ/s9mBnnyAB8Xgrl8ospbol5aTqTYufrpMGoBUqo90JAPOa1Qjep+r2U5QENAm3qW+
	wWx9l4lY8ZE0lAhSMy+8pFSh2oxDfrLq+xMnFw9z5RRnSDRSRe4wD/vJi6yhwPQJHw5KXq
	wgSS2fGYn3JUK0K5iBizypglh+cTinA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-554-SymjUkbQOLij3rcu63wQNQ-1; Thu,
 19 Dec 2024 18:12:10 -0500
X-MC-Unique: SymjUkbQOLij3rcu63wQNQ-1
X-Mimecast-MFC-AGG-ID: SymjUkbQOLij3rcu63wQNQ
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6447B195604F;
	Thu, 19 Dec 2024 23:12:09 +0000 (UTC)
Received: from [172.64.13.20] (unknown [10.30.32.164])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 85C7D19560A2;
	Thu, 19 Dec 2024 23:12:08 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (6.13.0-rc3,
 upstream-arm-next, 06a57361)
Date: Thu, 19 Dec 2024 23:12:08 -0000
To: will@kernel.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <64955.124121918121002524@us-mta-554.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UyNxNE6T1VCtOFH29YmmC_mr-khN_yaAYTGqbAB1kOE_1734649929
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_151215_878493_34E6A2DE 
X-CRM114-Status: UNSURE (   6.82  )
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
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge branch 'for-next/core' into for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1596629923

One or more kernel builds failed:
    Builds that are failing to boot:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1596629923-aarch64-kernel


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


