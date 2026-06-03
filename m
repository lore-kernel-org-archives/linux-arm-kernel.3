Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F418CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 08:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/e/xv0ovZgx2bB63UDixS7zmsKqHCwbNLAFYnz6/9PU=; b=HaXUtu5PLMtglez8wCcprlkfcH
	ixBku9FCUTQxiYArc1rIMt6eNK3IFddDo/Rv3Oq2lkkSHRhaBZ6yijDYnpqYxdQ+7cRGSIkus2x2q
	egmbYbzD1JXCu+JfKHviICp1jzU4OwiNtuxzz1o94maPjUHXfB4yT3OGZWLTMmTJbbtatt0SP1D2a
	rHsUWSFUyGdzwaKI1O2riCXBhu3p6/Fe1HOPPeHxXDOrs3geUn9aqvuZcZxpCdjjuO07nXwRRbsbV
	3L6go9JkIiTSS1QSIatWm6cSyqGEaJUS/E9c0v0QWc74suwBhEAzx6sIexwD5CclzE2ESoDzMZxZ1
	ur0t6esg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUh1M-0000000Ebmr-3ngj;
	Wed, 03 Jun 2026 08:32:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUh1K-0000000Ebm1-1mr3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 08:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780475532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/e/xv0ovZgx2bB63UDixS7zmsKqHCwbNLAFYnz6/9PU=;
	b=Kdqz6mlUVOSvj/tJ8+sFRLf4E55hDkzO7eE6bsFz2PYfOJgFHyosbtgBSMpxOVQ307JT19
	DpteqEGGEoz0f3/Bg+81MVTcctfyCMaR1G/p6Yk+Mn9l639ww9H805jnLzdR9YZrznWH25
	0WvcqJoF/mY/g8QL23fzhSRQYZBa44Y=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-VpjAefC6N1i6ELSNVpOcnA-1; Wed,
 03 Jun 2026 04:32:09 -0400
X-MC-Unique: VpjAefC6N1i6ELSNVpOcnA-1
X-Mimecast-MFC-AGG-ID: VpjAefC6N1i6ELSNVpOcnA_1780475528
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C35CE195608C;
	Wed,  3 Jun 2026 08:32:07 +0000 (UTC)
Received: from [172.20.176.34] (unknown [10.30.44.170])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 85601180049F;
	Wed,  3 Jun 2026 08:32:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 2 of 56): Test report for for-kernelci
 (7.1.0-rc6, upstream-arm-next, e8a95b97)
Date: Wed, 03 Jun 2026 08:32:05 -0000
To: linux-arm-kernel@lists.infradead.org, yoyang@redhat.com,
 ftjahjad@redhat.com, will@kernel.org, catalin.marinas@arm.com,
 bgoncalv@redhat.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <09110.126060304320900870@us-mta-618.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EmBIWmDxe6Gy465je4Z4nVlASD5BJ_xZ_16w8JIOcTM_1780475528
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_013214_614479_C4476826 
X-CRM114-Status: UNSURE (   4.86  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2571596185

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2571596185_aarch64_kernel_kcidb_tool_21399931_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2571596185_aarch64_kernel_kcidb_tool_21398598_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/001
                       =E2=9D=8C FAIL generic/004
                       =E2=9D=8C FAIL generic/005
                       =E2=9D=8C FAIL generic/006
                       =E2=9D=8C FAIL generic/007
                       =E2=9D=8C FAIL generic/008
                       =E2=9D=8C FAIL generic/012
                       =E2=9D=8C FAIL generic/014
                       =E2=9D=8C FAIL generic/016
                       =E2=9D=8C FAIL generic/021
                       =E2=9D=8C FAIL generic/022
                       =E2=9D=8C FAIL generic/023
                       =E2=9D=8C FAIL generic/024
                       =E2=9D=8C FAIL generic/025
                       =E2=9D=8C FAIL generic/026
                       =E2=9D=8C FAIL generic/028
                       =E2=9D=8C FAIL generic/030
                       =E2=9D=8C FAIL generic/031
                       =E2=9D=8C FAIL generic/037
                       =E2=9D=8C FAIL generic/052
                       =E2=9D=8C FAIL generic/058
                       =E2=9D=8C FAIL generic/060
                       =E2=9D=8C FAIL generic/061
                       =E2=9D=8C FAIL generic/063
                       =E2=9D=8C FAIL generic/064
                       =E2=9D=8C FAIL generic/069
                       =E2=9D=8C FAIL generic/078
                       =E2=9D=8C FAIL generic/086
                       =E2=9D=8C FAIL generic/096
                       =E2=9D=8C FAIL generic/097
                       =E2=9D=8C FAIL generic/098
                       =E2=9D=8C FAIL generic/103
                       =E2=9D=8C FAIL generic/105
                       =E2=9D=8C FAIL generic/110
                       =E2=9D=8C FAIL generic/111
                       =E2=9D=8C FAIL generic/114
                       =E2=9D=8C FAIL generic/115
                       =E2=9D=8C FAIL generic/116
                       =E2=9D=8C FAIL generic/123
                       =E2=9D=8C FAIL generic/134
                       =E2=9D=8C FAIL generic/138
                       =E2=9D=8C FAIL generic/140
                       =E2=9D=8C FAIL generic/141
                       =E2=9D=8C FAIL generic/142
                       =E2=9D=8C FAIL generic/143
                       =E2=9D=8C FAIL generic/144
                       =E2=9D=8C FAIL generic/145
                       =E2=9D=8C FAIL generic/146
                       =E2=9D=8C FAIL generic/147
                       =E2=9D=8C FAIL generic/148
                       =E2=9D=8C FAIL generic/149
                       =E2=9D=8C FAIL generic/150
                       =E2=9D=8C FAIL generic/151
                       =E2=9D=8C FAIL generic/152
                       =E2=9D=8C FAIL generic/153
                       =E2=9D=8C FAIL generic/154
                       =E2=9D=8C FAIL generic/155
                       =E2=9D=8C FAIL generic/156
                       =E2=9D=8C FAIL generic/157
                       =E2=9D=8C FAIL generic/159
                       =E2=9D=8C FAIL generic/160
                       =E2=9D=8C FAIL generic/161
                       =E2=9D=8C FAIL generic/171
                       =E2=9D=8C FAIL generic/172
                       =E2=9D=8C FAIL generic/173
                       =E2=9D=8C FAIL generic/174
                       =E2=9D=8C FAIL generic/178
                       =E2=9D=8C FAIL generic/179
                       =E2=9D=8C FAIL generic/180
                       =E2=9D=8C FAIL generic/181
                       =E2=9D=8C FAIL generic/183
                       =E2=9D=8C FAIL generic/185
                       =E2=9D=8C FAIL generic/188
                       =E2=9D=8C FAIL generic/189
                       =E2=9D=8C FAIL generic/190
                       =E2=9D=8C FAIL generic/191
                       =E2=9D=8C FAIL generic/194
                       =E2=9D=8C FAIL generic/195
                       =E2=9D=8C FAIL generic/196
                       =E2=9D=8C FAIL generic/197
                       =E2=9D=8C FAIL generic/198
                       =E2=9D=8C FAIL generic/199
                       =E2=9D=8C FAIL generic/200
                       =E2=9D=8C FAIL generic/201
                       =E2=9D=8C FAIL generic/202
                       =E2=9D=8C FAIL generic/203
                       =E2=9D=8C FAIL generic/205
                       =E2=9D=8C FAIL generic/206
                       =E2=9D=8C FAIL generic/207
                       =E2=9D=8C FAIL generic/211
                       =E2=9D=8C FAIL generic/212
                       =E2=9D=8C FAIL generic/214
                       =E2=9D=8C FAIL generic/216
                       =E2=9D=8C FAIL generic/217
                       =E2=9D=8C FAIL generic/220
                       =E2=9D=8C FAIL generic/221
                       =E2=9D=8C FAIL generic/222
                       =E2=9D=8C FAIL generic/227
                       =E2=9D=8C FAIL generic/238
                       =E2=9D=8C FAIL generic/246
                       =E2=9D=8C FAIL generic/248
                       =E2=9D=8C FAIL generic/253
                       =E2=9D=8C FAIL generic/259
                       =E2=9D=8C FAIL generic/261
                       =E2=9D=8C FAIL generic/262
                       =E2=9D=8C FAIL generic/264
                       =E2=9D=8C FAIL generic/277
                       =E2=9D=8C FAIL generic/287
                       =E2=9D=8C FAIL generic/289
                       =E2=9D=8C FAIL generic/290
                       =E2=9D=8C FAIL generic/291
                       =E2=9D=8C FAIL generic/292
                       =E2=9D=8C FAIL generic/293
                       =E2=9D=8C FAIL generic/295
                       =E2=9D=8C FAIL generic/296
                       =E2=9D=8C FAIL generic/301
                       =E2=9D=8C FAIL generic/302
                       =E2=9D=8C FAIL generic/303
                       =E2=9D=8C FAIL generic/304
                       =E2=9D=8C FAIL generic/305
                       =E2=9D=8C FAIL generic/309
                       =E2=9D=8C FAIL generic/312
                       =E2=9D=8C FAIL generic/326
                       =E2=9D=8C FAIL generic/327
                       =E2=9D=8C FAIL generic/328
                       =E2=9D=8C FAIL generic/330
                       =E2=9D=8C FAIL generic/332
                       =E2=9D=8C FAIL generic/337
                       =E2=9D=8C FAIL generic/353
                       =E2=9D=8C FAIL generic/358
                       =E2=9D=8C FAIL generic/359
                       =E2=9D=8C FAIL generic/362
                       =E2=9D=8C FAIL generic/372
                       =E2=9D=8C FAIL generic/379
                       =E2=9D=8C FAIL generic/380
                       =E2=9D=8C FAIL generic/389
                       =E2=9D=8C FAIL generic/391
                       =E2=9D=8C FAIL generic/393
                       =E2=9D=8C FAIL generic/395
                       =E2=9D=8C FAIL generic/396
                       =E2=9D=8C FAIL generic/397
                       =E2=9D=8C FAIL generic/398
                       =E2=9D=8C FAIL generic/406
                       =E2=9D=8C FAIL generic/408
                       =E2=9D=8C FAIL generic/412
                       =E2=9D=8C FAIL generic/414
                       =E2=9D=8C FAIL generic/419
                       =E2=9D=8C FAIL generic/421
                       =E2=9D=8C FAIL generic/424
                       =E2=9D=8C FAIL generic/432
                       =E2=9D=8C FAIL generic/433
                       =E2=9D=8C FAIL generic/439
                       =E2=9D=8C FAIL generic/440
                       =E2=9D=8C FAIL generic/443
                       =E2=9D=8C FAIL generic/462
                       =E2=9D=8C FAIL generic/463
                       =E2=9D=8C FAIL generic/470
                       =E2=9D=8C FAIL generic/474
                       =E2=9D=8C FAIL generic/488
                       =E2=9D=8C FAIL generic/492
                       =E2=9D=8C FAIL generic/493
                       =E2=9D=8C FAIL generic/496
                       =E2=9D=8C FAIL generic/497
                       =E2=9D=8C FAIL generic/499
                       =E2=9D=8C FAIL generic/503
                       =E2=9D=8C FAIL generic/505
                       =E2=9D=8C FAIL generic/506
                       =E2=9D=8C FAIL generic/507
                       =E2=9D=8C FAIL generic/508
                       =E2=9D=8C FAIL generic/511
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2571596185_aarch64_kernel_kcidb_tool_21398740_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/001
                       =E2=9D=8C FAIL generic/004
                       =E2=9D=8C FAIL generic/005
                       =E2=9D=8C FAIL generic/006
                       =E2=9D=8C FAIL generic/007
                       =E2=9D=8C FAIL generic/008
                       =E2=9D=8C FAIL generic/012
                       =E2=9D=8C FAIL generic/014
                       =E2=9D=8C FAIL generic/016
                       =E2=9D=8C FAIL generic/021
                       =E2=9D=8C FAIL generic/022
                       =E2=9D=8C FAIL generic/023
                       =E2=9D=8C FAIL generic/024
                       =E2=9D=8C FAIL generic/025
                       =E2=9D=8C FAIL generic/026
                       =E2=9D=8C FAIL generic/028
                       =E2=9D=8C FAIL generic/030
                       =E2=9D=8C FAIL generic/031
                       =E2=9D=8C FAIL generic/037
                       =E2=9D=8C FAIL generic/052
                       =E2=9D=8C FAIL generic/058
                       =E2=9D=8C FAIL generic/060
                       =E2=9D=8C FAIL generic/061
                       =E2=9D=8C FAIL generic/063
                       =E2=9D=8C FAIL generic/064
                       =E2=9D=8C FAIL generic/069
                       =E2=9D=8C FAIL generic/078
                       =E2=9D=8C FAIL generic/086
                       =E2=9D=8C FAIL generic/096
                       =E2=9D=8C FAIL generic/097
                       =E2=9D=8C FAIL generic/098
                       =E2=9D=8C FAIL generic/103
                       =E2=9D=8C FAIL generic/105
                       =E2=9D=8C FAIL generic/110
                       =E2=9D=8C FAIL generic/111
                       =E2=9D=8C FAIL generic/114
                       =E2=9D=8C FAIL generic/115
                       =E2=9D=8C FAIL generic/116
                       =E2=9D=8C FAIL generic/123
                       =E2=9D=8C FAIL generic/134
                       =E2=9D=8C FAIL generic/138
                       =E2=9D=8C FAIL generic/140
                       =E2=9D=8C FAIL generic/141
                       =E2=9D=8C FAIL generic/142
                       =E2=9D=8C FAIL generic/143
                       =E2=9D=8C FAIL generic/144
                       =E2=9D=8C FAIL generic/145
                       =E2=9D=8C FAIL generic/146
                       =E2=9D=8C FAIL generic/147
                       =E2=9D=8C FAIL generic/148
                       =E2=9D=8C FAIL generic/149
                       =E2=9D=8C FAIL generic/150
                       =E2=9D=8C FAIL generic/151
                       =E2=9D=8C FAIL generic/152
                       =E2=9D=8C FAIL generic/153
                       =E2=9D=8C FAIL generic/154
                       =E2=9D=8C FAIL generic/155
                       =E2=9D=8C FAIL generic/156
                       =E2=9D=8C FAIL generic/157
                       =E2=9D=8C FAIL generic/159
                       =E2=9D=8C FAIL generic/160
                       =E2=9D=8C FAIL generic/161
                       =E2=9D=8C FAIL generic/171
                       =E2=9D=8C FAIL generic/172
                       =E2=9D=8C FAIL generic/173
                       =E2=9D=8C FAIL generic/174
                       =E2=9D=8C FAIL generic/178
                       =E2=9D=8C FAIL generic/179
                       =E2=9D=8C FAIL generic/180
                       =E2=9D=8C FAIL generic/181
                       =E2=9D=8C FAIL generic/183
                       =E2=9D=8C FAIL generic/185
                       =E2=9D=8C FAIL generic/188
                       =E2=9D=8C FAIL generic/189
                       =E2=9D=8C FAIL generic/190
                       =E2=9D=8C FAIL generic/191
                       =E2=9D=8C FAIL generic/194
                       =E2=9D=8C FAIL generic/195
                       =E2=9D=8C FAIL generic/196
                       =E2=9D=8C FAIL generic/197
                       =E2=9D=8C FAIL generic/198
                       =E2=9D=8C FAIL generic/199
                       =E2=9D=8C FAIL generic/200
                       =E2=9D=8C FAIL generic/201
                       =E2=9D=8C FAIL generic/202
                       =E2=9D=8C FAIL generic/203
                       =E2=9D=8C FAIL generic/205
                       =E2=9D=8C FAIL generic/206
                       =E2=9D=8C FAIL generic/207
                       =E2=9D=8C FAIL generic/211
                       =E2=9D=8C FAIL generic/212
                       =E2=9D=8C FAIL generic/214
                       =E2=9D=8C FAIL generic/216
                       =E2=9D=8C FAIL generic/217
                       =E2=9D=8C FAIL generic/220
                       =E2=9D=8C FAIL generic/221
                       =E2=9D=8C FAIL generic/222
                       =E2=9D=8C FAIL generic/227
                       =E2=9D=8C FAIL generic/238
                       =E2=9D=8C FAIL generic/246
                       =E2=9D=8C FAIL generic/248
                       =E2=9D=8C FAIL generic/253
                       =E2=9D=8C FAIL generic/259
                       =E2=9D=8C FAIL generic/261
                       =E2=9D=8C FAIL generic/262
                       =E2=9D=8C FAIL generic/264
                       =E2=9D=8C FAIL generic/277
                       =E2=9D=8C FAIL generic/287
                       =E2=9D=8C FAIL generic/289
                       =E2=9D=8C FAIL generic/290
                       =E2=9D=8C FAIL generic/291
                       =E2=9D=8C FAIL generic/292
                       =E2=9D=8C FAIL generic/293
                       =E2=9D=8C FAIL generic/295
                       =E2=9D=8C FAIL generic/296
                       =E2=9D=8C FAIL generic/301
                       =E2=9D=8C FAIL generic/302
                       =E2=9D=8C FAIL generic/303
                       =E2=9D=8C FAIL generic/304
                       =E2=9D=8C FAIL generic/305
                       =E2=9D=8C FAIL generic/309
                       =E2=9D=8C FAIL generic/312
                       =E2=9D=8C FAIL generic/326
                       =E2=9D=8C FAIL generic/327
                       =E2=9D=8C FAIL generic/328
                       =E2=9D=8C FAIL generic/330
                       =E2=9D=8C FAIL generic/332
                       =E2=9D=8C FAIL generic/337
                       =E2=9D=8C FAIL generic/353
                       =E2=9D=8C FAIL generic/358
                       =E2=9D=8C FAIL generic/359
                       =E2=9D=8C FAIL generic/362
                       =E2=9D=8C FAIL generic/372
                       =E2=9D=8C FAIL generic/379
                       =E2=9D=8C FAIL generic/380
                       =E2=9D=8C FAIL generic/389
                       =E2=9D=8C FAIL generic/391
                       =E2=9D=8C FAIL generic/393
                       =E2=9D=8C FAIL generic/395
                       =E2=9D=8C FAIL generic/396
                       =E2=9D=8C FAIL generic/397
                       =E2=9D=8C FAIL generic/398
                       =E2=9D=8C FAIL generic/406
                       =E2=9D=8C FAIL generic/408
                       =E2=9D=8C FAIL generic/412
                       =E2=9D=8C FAIL generic/414
                       =E2=9D=8C FAIL generic/419
                       =E2=9D=8C FAIL generic/421
                       =E2=9D=8C FAIL generic/424
                       =E2=9D=8C FAIL generic/432
                       =E2=9D=8C FAIL generic/433
                       =E2=9D=8C FAIL generic/439
                       =E2=9D=8C FAIL generic/440
                       =E2=9D=8C FAIL generic/443
                       =E2=9D=8C FAIL generic/462
                       =E2=9D=8C FAIL generic/463
                       =E2=9D=8C FAIL generic/470
                       =E2=9D=8C FAIL generic/474
                       =E2=9D=8C FAIL generic/488
                       =E2=9D=8C FAIL generic/492
                       =E2=9D=8C FAIL generic/493
                       =E2=9D=8C FAIL generic/496
                       =E2=9D=8C FAIL generic/497
                       =E2=9D=8C FAIL generic/499
                       =E2=9D=8C FAIL generic/503
                       =E2=9D=8C FAIL generic/505
                       =E2=9D=8C FAIL generic/506
                       =E2=9D=8C FAIL generic/507
                       =E2=9D=8C FAIL generic/508
                       =E2=9D=8C FAIL generic/511

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] Hardware - Firmware test suite - auto-waive failu=
res
            URL: https://gitlab.com/cki-project/infrastructure/-/issues/779
            Affected tests:
                Hardware - Firmware test suite [aarch64]


Tests that were not ran because of internal issues:
    /distribution/command [aarch64]
    Reboot test [aarch64]


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


