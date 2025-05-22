Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9D5C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 14:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T2GVJHql/RQ82lkBSe8ZEP2j0WZyXcooLZykNBFb6vE=; b=PP7POoWCsQBoo66SgcU5l4z6L1
	mtuiO9IR7+ZabMC2IHr6hDxIu+NclOosDUUw4wVczeFCtj8cX6O/xhaohZKlXwlQQKhor8v3DsGY4
	4Y8coI8YgVxKySMwfQL3JGDgro39nhbYGHwJcY1vUOthrC+d8tEbzr6EXUtPKBOGJhsG/kTFyAxXM
	knzuHUpKx3w28gVbiKJpmR4sliw9Ss6rwG4Ifdy+k3jOUjuipauAznJWd8krPJAgcaNlicKWWsvcF
	Fy1v3AO3KKNAyrm7D12WS+Y+Y5rEAv4F8P4d440Q0FxBposbULSmLZ0FdVo+Q+aC51RGQHfAtNoQb
	apYO3TNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI6xo-00000001GMl-0y6Y;
	Thu, 22 May 2025 14:32:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI6oJ-00000001EqJ-2kWY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:22:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747923733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T2GVJHql/RQ82lkBSe8ZEP2j0WZyXcooLZykNBFb6vE=;
	b=OdtshjI1BQmGgp6+iIGqLeZQWkdZiwg3G5Yh1ZjQoBBt3BfW6e6mHUwp1BVBZPF0Qm9nxN
	Lrk1DSCBeBQ3a5Q1sGRrc48f5g0JVwQdF5CRGFhxhx5grmEoQcInVkkquRAU6falhGXHVo
	w1jP8M4gMKHMwFVfXCRD0rcNGxQAe4w=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-212-gxhqtbxqNX6RYAe2Cz9aDA-1; Thu,
 22 May 2025 10:22:10 -0400
X-MC-Unique: gxhqtbxqNX6RYAe2Cz9aDA-1
X-Mimecast-MFC-AGG-ID: gxhqtbxqNX6RYAe2Cz9aDA_1747923729
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D0A4919560AD;
	Thu, 22 May 2025 14:22:08 +0000 (UTC)
Received: from [172.20.77.114] (unknown [10.30.44.38])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 147BE1955E83;
	Thu, 22 May 2025 14:22:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (6.15.0-rc7,
 upstream-arm-next, d7fa1af5)
Date: Thu, 22 May 2025 14:22:07 -0000
To: linux-arm-kernel@lists.infradead.org, mmalik@redhat.com,
 catalin.marinas@arm.com, omosnace@redhat.com, will@kernel.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <82650.125052210221000489@us-mta-212.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: it7NaH5O6Z3C-KpNbGujMHTwPPJEXd0VchKjIPqK_rY_1747923729
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_072215_764535_CA28A9D1 
X-CRM114-Status: UNSURE (   6.66  )
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
    Commit message: Merge branch 'for-next/core' into for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1831136286

One or more kernel tests failed:
    Unrecognized or new issues:
        selinux-policy: serge-testsuite
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1831136286-aarch64-kernel_upt_23
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test



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


