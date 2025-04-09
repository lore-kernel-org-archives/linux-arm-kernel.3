Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786F4C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g6o5eIEvoxTvbPKOdmXqx0ePctAiWP36bpl5irlgbb8=; b=FvY5U3EuQhS/I4QxsH2ODzNuHj
	jirmBdYFGWUVYPEAtu2AVHEcXOEcQSfsrw4RrsNGWYLo8+9uuDs4INla9K06yfywINfhWXNzghE7i
	vj18s5nF84lwz6voDKN3xC+LNjtTf1nXiCIB2fUEZCTm4SZvfMEuEqCMaGlHXKJBtW58HbkJisT4+
	6/93cQG6QF6DUFWuYRtlSexO8E0T0mFam/QYKRKTZz0P7trJqG8hJaUtdgT+6TtlErrVauKLgQ6wh
	8gEY/hd//Yiwo2sOa6VDZoNLN/VZnnBfsjVS75IOiFaNH9R6birZ2UZeC+yqSKOstL0V75JQ4eC9a
	T9q77jnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TYE-00000006zLf-1AWa;
	Wed, 09 Apr 2025 11:25:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TWQ-00000006z8n-3hMF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 11:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744197788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g6o5eIEvoxTvbPKOdmXqx0ePctAiWP36bpl5irlgbb8=;
	b=YLlF8pRO7BBVtQ/Mukz9n6zQZ+IboT+IhXWbqwJ//uDzQuzJY19SuLk23R8WO8qtCFieBB
	3Y6kt6aJBi5JxKWmVHaXhppdRvW/vzs8YSlgEhWQ98tlPaLFqflTNsTKhhEF00ol7euAnw
	rxmz8kdnmgVmyd8dnWU4xrdp0BnaoZ8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-77-TI8Rj0XDOdyDqKxqE71RKQ-1; Wed,
 09 Apr 2025 07:23:07 -0400
X-MC-Unique: TI8Rj0XDOdyDqKxqE71RKQ-1
X-Mimecast-MFC-AGG-ID: TI8Rj0XDOdyDqKxqE71RKQ_1744197786
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CAFBC19560B6;
	Wed,  9 Apr 2025 11:23:05 +0000 (UTC)
Received: from [172.20.65.13] (unknown [10.30.44.73])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4540519560AD;
	Wed,  9 Apr 2025 11:23:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.15.0-rc1,
 upstream-arm-next, 0af2f6be)
Date: Wed, 09 Apr 2025 11:23:04 -0000
To: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <57385.125040907230700127@us-mta-77.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w3Le-PBVQgksjEbuqF-6z-0ZO2hKKKKL6WfCf-rApxg_1744197786
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_042310_994641_56566F42 
X-CRM114-Status: UNSURE (   6.45  )
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
    Commit message: Linux 6.15-rc1

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1759427041


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


