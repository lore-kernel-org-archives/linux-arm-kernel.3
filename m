Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2106C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 18:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bE46KB/3G+2+ABTh7KVlrMSn9vKCavvCTmKvYooyR0U=; b=Crf52Vn4uM51ZzMqV1mPQdpwQo
	mOVeB7jqCH/J9/I7gsG8oigUx6p4WCKqtUomLUf10wy85XDPq6aOsVm0qWyrPk2UZeabktj2vR/FY
	Ko6AKHdrmjI9RLZZF3vchxI/9zAV2NnxTKPViwt+Q/Ddmx8x3/WZuNhOY+CeeEHM+ZwFwcQb2o77v
	S+xDR70Y1TegiACjE/yBQ8EHHsJGVg2HB1kOnx5ZO/xTKezPXnoGLrHonkf4oOC/y/39QaqqhhtNb
	yDo185tUlXCdqeSnJuecHTsUrbWDJaZQGQlGCm5lujCP678r4fjVTwm7IcxFBb8XSrOHM5XvLfj6y
	krWnxN6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqGDh-0000000BtzY-3tj8;
	Thu, 06 Mar 2025 18:45:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqGAd-0000000BtRN-2g5T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 18:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741286530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bE46KB/3G+2+ABTh7KVlrMSn9vKCavvCTmKvYooyR0U=;
	b=D8p+K7Lio8s/elKgdtinX5H33l6tHbHijFpPFMOdtze1rQ9/Ojh4q+SM9dYiEmcpty73Sz
	eOiFrCjoJG0rTNx6FrSgRAxcwYj6OgEalC/YjoVnrby9HGTVeFj8ls3rVkJQJ+jaBkfAu1
	+nrD5AwEhWwV0vdoWI2JFd7LvtGRkRg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-RtIRS0LrMOSoCD9xb6XN2w-1; Thu,
 06 Mar 2025 13:42:07 -0500
X-MC-Unique: RtIRS0LrMOSoCD9xb6XN2w-1
X-Mimecast-MFC-AGG-ID: RtIRS0LrMOSoCD9xb6XN2w_1741286526
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 61F291800262;
	Thu,  6 Mar 2025 18:42:06 +0000 (UTC)
Received: from [172.64.10.8] (unknown [10.30.34.106])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A8B61180174F;
	Thu,  6 Mar 2025 18:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.14.0-rc5,
 upstream-arm-next, 14d05f12)
Date: Thu, 06 Mar 2025 18:42:05 -0000
To: catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <66225.125030613420703370@us-mta-618.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TjMLKYcvtvHCD731heJMosXjVqocrhK6ht6NucIRtik_1741286526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_104211_746250_2FC21B22 
X-CRM114-Status: UNSURE (   6.49  )
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

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge remote-tracking branch 'will/for-next/perf' into =
for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1703542044

One or more kernel builds failed:
    We also see the following known issues which are not related to your ch=
anges:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1703542044-aarch64-kernel
                   Issue: [upstream] error: initializer-string for array of=
 'char' is too long [-Werror=3Dunterminated-string-initialization]
                          https://gitlab.com/cki-project/infrastructure/-/i=
ssues/473


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


