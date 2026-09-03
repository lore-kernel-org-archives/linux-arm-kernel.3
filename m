Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F90DC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 18:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gqNUMFbRlYb0WTdPiS4AzbImj7tFqoapiehUCb/4bk0=; b=zbTJmqHRRxKxFRUuOmAnexT1Yg
	ds3Cxk4eMiNR9xJvMTpCrrf6LATIkQ2ILxDYUAG9RdVAa/RaP2fd3tZrZprqumjPli1uUvCGQtcpg
	sX7W6XxjhKmufK5KHBYcNUMyN01c8iupzRZnNd0iAdLuQkNQgQbxE7bPZtF+wRxGDx4z2Nj0ea9eo
	5YgfU43Xcxd1hd2NeWGtEdenW662j1f4Vhe7FpyV2S7kw+XVyD1WIWfydWAIXF7BYCqJh47BIiaFU
	w9wD0FpN4VhEAiS/mguKak1Xi7UC7G0z6e2b10qkHgdpYNoNXcj95Qp3XQBaqr5Xfr9JNw7YJfmrr
	4Sd89hFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CYm-00000000OHm-432x;
	Thu, 03 Sep 2026 18:53:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CYj-00000000OHQ-1niM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 18:53:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788461591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gqNUMFbRlYb0WTdPiS4AzbImj7tFqoapiehUCb/4bk0=;
	b=Us5rcoEpvs2foGhd8I78SoZDHktp8ps58mmBOPCigCbDM7cVGRtHQly1BIJLifxd3lHXS4
	bY4ELvWGe1Aue5myHe38qzuof6BGJ5Bz4CDza3SuyigAiHJeDY3nw7/uLBybC3A0dMos/w
	WcASfEdaRWA3ko3nxm7slpQ2Ki/tqH4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-624-FKuYXwQCMLexVNv0ozAsVA-1; Thu,
 03 Sep 2026 14:53:07 -0400
X-MC-Unique: FKuYXwQCMLexVNv0ozAsVA-1
X-Mimecast-MFC-AGG-ID: FKuYXwQCMLexVNv0ozAsVA_1788461586
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DFC06190A0AF;
	Thu,  3 Sep 2026 18:53:05 +0000 (UTC)
Received: from [172.20.168.70] (unknown [10.30.45.63])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4E1A91955F7C;
	Thu,  3 Sep 2026 18:53:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (7.3.0-rc1,
 upstream-arm-next, cee9395a)
Date: Thu, 03 Sep 2026 18:53:04 -0000
To: will@kernel.org, ftjahjad@redhat.com, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, bgoncalv@redhat.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <86700.126090314530700729@us-mta-624.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h4k1aQqvZRSaa6dZ4uElXQTrO0K1g5eWGtVbDdCmv_8_1788461586
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_115313_541781_AD1C6ECF 
X-CRM114-Status: UNSURE (   7.49  )
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
    Commit message: Linux 7.3-rc1

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2817106420

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2817106420_aarch64_kernel_kcidb_tool_1200154011_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2817106420_aarch64_kernel_kcidb_tool_1200154013_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2817106420_aarch64_kernel_kcidb_tool_1200154011_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2817106420_aarch64_kernel_kcidb_tool_1200154013_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

    We also see the following known issues which are not related to your ch=
anges:
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


