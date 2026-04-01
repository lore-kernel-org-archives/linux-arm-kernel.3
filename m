Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7E810FCAEA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 21:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3O2GVGWaBMCvabMgPOhqc/aw6SIkTM15K/MQiGUwnwM=; b=BDh3Q02DlgYlLqXoDPlD2iUXDM
	RMf4fkm6o12yTm+JgNqcjJnkki3dn0ex+iRMj5p20Nvm018yJEfYJaGekxy3va3enYTwAZqlzX/rU
	jB7YbzOsX6iKF9Ag4W1gpVUh4Kq1lxH22JlC6Zl9Cz+C9Xay1fAcC1Mf+xsQAIIu3gLEyL/9dugNv
	Xc3HQoimGn5x2KaxOV1J4bRcJvruU9Q17m1UekhCTh2QDZQ+vzh1fUzBHVrVI4tvUndhzNqbkeLDJ
	jkJumR8JnZufFEWzb2QFvE+h/2EGay73DD7WO6cg92q8NAxseccfA96I199AK0ApAs+xKfOBABBFr
	6CWITO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w83Tz-0000000G8f6-0kaK;
	Wed, 01 Apr 2026 21:52:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w83Tw-0000000G8ed-0s2k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 21:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775080329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3O2GVGWaBMCvabMgPOhqc/aw6SIkTM15K/MQiGUwnwM=;
	b=ZWA2f+ud1sITsTtNsIu8qUo8a9oQHtiAkSXPzW4hipUkeSgll4KvXbop6q9hHXSRHSAFMD
	ydelGaoG3fQsrWMX6Fdfh/inKoTvUNcj5eraCVqvv4B1IunKBW2MKbNwbvjjjEa6gfYCKd
	BrkYduRNF/IZ7BT2iRQfHIPoj6riwk4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-306-XSQBYwT7P2yXvIfB4XJVKw-1; Wed,
 01 Apr 2026 17:52:07 -0400
X-MC-Unique: XSQBYwT7P2yXvIfB4XJVKw-1
X-Mimecast-MFC-AGG-ID: XSQBYwT7P2yXvIfB4XJVKw_1775080326
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C3CF18005B3;
	Wed,  1 Apr 2026 21:52:06 +0000 (UTC)
Received: from [172.20.155.76] (unknown [10.30.44.186])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9651A18002A6;
	Wed,  1 Apr 2026 21:52:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (7.0.0-rc6,
 upstream-arm-next, 90aebc1e)
Date: Wed, 01 Apr 2026 21:52:05 -0000
To: will@kernel.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <71169.126040117520700553@us-mta-306.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Xv8j3rBaJMH-fUW7A9FLQrtMOyYUH9hcaRP5B4HtyFU_1775080326
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_145212_320128_4B4E2C55 
X-CRM114-Status: UNSURE (   6.75  )
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
    Commit message: Merge remote-tracking branch 'origin/nocache-cleanup' i=
nto for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2424361415


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


