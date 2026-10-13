Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD5DCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 23:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G94rIu7uhplgRWnPQkY1HYuhAjTnbmgLXX2j4rWrnbY=; b=T4/5EgEyDYMltJFrOU/TmD7w9a
	sYxj+SNkcT1eHt8d35L/hTtn0TJBkBfRhl5DI4fV+JXJ4H84SjhQWwlKED0yLaMdowDc5dRlerHWa
	KAzL9M4RR8uyXwnJIHKIHGIvyMGMETPDmGcb5s9F9t3IGnWXJMffvZZyD8Xj9sC+436DxZ/dqJlfF
	pX371ktfLZYeyvfjE9YK18qh2fqRbojSJo77V6EDu2xRMTekOnRmsOtT6eExnJKpAS5C/xxsbm8Oh
	n3bK9VKbNxdcqNqB+22C2+8uP/9K1HLPPBjPTpyuuA9ZnOuoRotD4I3dV6/fSDHnVg0AJFm2tlGj1
	8cTtXjyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGm9Y-0000000EF0P-1GnB;
	Tue, 13 Oct 2026 23:43:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGm9N-0000000EEzo-0pH9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 23:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791934994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G94rIu7uhplgRWnPQkY1HYuhAjTnbmgLXX2j4rWrnbY=;
	b=YGacc67zGKYyD20OzteGbsVEY+bhr43RMGLMtNQfCBdrjGO1DfZxXDsMLe8Go0pr3DJiAD
	6jmiLOL7SDps1uvu+t9jG6jXcM1bhhngZu321L1feRyU55z50jsjdOmI/J0SuP8EUuS6Qy
	ETJKl8/6vOjJAhwlMh4tY8gnnqgtzLQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-669-SUNR9vaDMIGuQKf_-BZRJg-1; Tue,
 13 Oct 2026 23:43:05 +0000
X-MC-Unique: SUNR9vaDMIGuQKf_-BZRJg-1
X-Mimecast-MFC-AGG-ID: SUNR9vaDMIGuQKf_-BZRJg_1791934985
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DA50F1956077;
	Tue, 13 Oct 2026 23:43:03 +0000 (UTC)
Received: from [172.20.178.115] (unknown [10.30.44.133])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1AA361800446;
	Tue, 13 Oct 2026 23:43:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (7.3.0-rc7,
 upstream-arm-next, c16e7ffe)
Date: Tue, 13 Oct 2026 23:43:02 -0000
To: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
 mmalik@redhat.com, will@kernel.org, omosnace@redhat.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <64120.126101319430501780@us-mta-669.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B69i48iaJr09_vUCcscmZu1A_17ygJjBezXXXVLNvmM_1791934985
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_164321_322886_AF7DD553 
X-CRM114-Status: UNSURE (   6.71  )
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
    Commit message: Merge remote-tracking branch 'will/for-next/perf' into =
for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2943549192

One or more kernel tests failed:
    Unrecognized or new issues:
        selinux-policy: serge-testsuite
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2943549192_aarch64_kernel_kcidb_tool_1200461433_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test

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


