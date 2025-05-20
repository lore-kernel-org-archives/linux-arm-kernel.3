Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17ECC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 20:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l6lsJOwdMz/4dH3TptcrlUKTtJw4Ubx9VpVLlW3fE68=; b=F4vPy3YvCb2W0y4BNamhpvW13m
	NyTZu6nVgfrFiUi8EUHcCWLLV34WsRj2w1K3JIaUn+weTq+E96E2KP5WkT1Q/ot/n18Im+QBJt0WQ
	tpMVlQ1h3tpY5nkFEANytizg5TkFK5m6l0qBoFu178vGfXWvJMigdbw1S6RqjxarZYMnMgSADBcyq
	W1DFOWyTWGklsCUVUo17NwUnqgsslxoPt1+wJ8sq3S7ZG9fkUFw0z8NQlqFz36sOu8c33f9EHlzrN
	QsvIA6HO+X4uxc0UFItxRAllQNgmYGCkVv+AUp3d2+HtnBBwTotnCLpt9NkEXP6Mfd7jiN6DGUKxu
	bx9DHHfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHTOu-0000000E485-2O8n;
	Tue, 20 May 2025 20:17:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHTKp-0000000E3dQ-0ane
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 20:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747771988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l6lsJOwdMz/4dH3TptcrlUKTtJw4Ubx9VpVLlW3fE68=;
	b=NlPF/asVbNiJgUnpl/DQ2/RnHQC2nRYMV0MwaVryeD5B6CyeH1VpxX6e/OuuFL7ukFzBgf
	ayF9K5c9P/ic7pT2whYnTfbdhB6IpZM0GdzkNJxbGT0NQ+C9jPdoveu/lPwvw/phaievRK
	XV9IG4K9UcxYFujGn+AiVpSQs0BWsqA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-266-8bKLUL_cMVChoEkuhu7XlQ-1; Tue,
 20 May 2025 16:13:04 -0400
X-MC-Unique: 8bKLUL_cMVChoEkuhu7XlQ-1
X-Mimecast-MFC-AGG-ID: 8bKLUL_cMVChoEkuhu7XlQ_1747771983
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3682C1956046;
	Tue, 20 May 2025 20:13:03 +0000 (UTC)
Received: from [172.20.77.114] (unknown [10.30.44.38])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8C548195608F;
	Tue, 20 May 2025 20:13:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (6.15.0-rc7,
 upstream-arm-next, 187899f4)
Date: Tue, 20 May 2025 20:13:02 -0000
To: linux-arm-kernel@lists.infradead.org, mmalik@redhat.com,
 catalin.marinas@arm.com, omosnace@redhat.com, will@kernel.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <02407.125052016130402593@us-mta-266.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7nK19mFWJk3ifcA4AuWoRr7J_lpdn5ZfRXuBu7o1Wa4_1747771983
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_131311_253030_8CFED312 
X-CRM114-Status: UNSURE (   7.05  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1827578492

One or more kernel tests failed:
    Unrecognized or new issues:
        selinux-policy: serge-testsuite
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1827578492-aarch64-kernel_upt_23
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


