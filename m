Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF07C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 12:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqGptO2eIB/qYhTXbL0ZOcw76oucCT92viU83AkSH8I=; b=XL05MRt1JttivzMZqGBlzKfet/
	/qU4oOp+GN+eXtWlF2lsHOX31E0cM0fWIYYIpN06JI/rqvkGb2UoQOek+06V12R6WMD4Ut4bnWVij
	wqM4JY/m/xZqQg3NdbGhqJK+VSG7/EYG/WL/+NYXP2pM31qXcfrgPl5P5/CX2fZowDrpysXeSPuhG
	cfSiVrKavsrl6bf0lFJxrkPpK8/9eb1R/RAvGlWqZCS8aPmUADmzzTexjhx5y38VJjq0HliPid7XP
	A/Xi5nGr3RkjuOOQUi9Xy0NHg1OcOkbkAmkf8esLQFh37edwxQnFNYYusn03WH/qU2scvAw/Y6Uyd
	Grj+sk1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbwc-00000001ayF-0FKV;
	Thu, 28 Aug 2025 12:41:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZ6b-00000001061-2U5D
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 28 Aug 2025 09:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VqGptO2eIB/qYhTXbL0ZOcw76oucCT92viU83AkSH8I=; b=pGz/3ZCBUYTsQaNFckeAVQAlCR
	iEsywz/kAI4SOabLiTs+ygBzivgl/ZeXxLHo4Aafg7E+YEIDEBND4TAJ5uH99nhPBx3yxSC4aOMqq
	nEgHSWfHaYHowTReX+C+MzXj7l8LMjhBM1I8DQ/VWCNdARw/ql2udxv+WbAz80kQm9yVZgmXwH9i6
	0PoKa0E+DSQL9emgEHKBjF0uNt2bCbpsfPo7XZ4Nd0FmdgUnvW2WqxCTHPzqlcCnntvKjNaUJwIRy
	C7RpQBzXXr7Yff6CfcXhJfW4TRabWKZIPIIDON322CZ2FrFbW/K8W7aNlHah+L2TxrwTPTzlMeYVf
	eSkrB5qQ==;
Received: from fra-out-004.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([3.74.81.189])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZ6W-00000002gRB-3zH2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 09:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1756373976; x=1787909976;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VqGptO2eIB/qYhTXbL0ZOcw76oucCT92viU83AkSH8I=;
  b=AVGO+GyrcCZ637N0VocpK3ONIVx0+o9DjJd7sVa10ZCUWVYGw/0Df6AG
   we6UzDmN8KzNJNvsloR898JM2njLeJJGILVqB6Mwbi7DSUhy2WvjdlO8/
   OYgGx1UDem2hvuH//TZs+/x4i3RBBk64USTMX1XUcS9PXMjOcofEJmCk9
   mXJL9wn0y18KUnUerLsprp5kVyuZAkl76MRWwRBCNfWbxXymLLhtiUCmS
   VZKubbCh+9QAh1RZq0irWlV8NVAwzOu/ioiVo4tbx3gUaOquBKPmyNd1z
   5CmGWWFnLJDUwP2uHCh64rDj6tOYTLGMpKc7SPtE13vcV3rgYdfu2yZ41
   A==;
X-CSE-ConnectionGUID: XkXzBx06QR6nJzl0Yj+R6Q==
X-CSE-MsgGUID: YW4iRhH6SrWZheQA5BAZZg==
X-IronPort-AV: E=Sophos;i="6.18,214,1751241600"; 
   d="scan'208";a="1303839"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
  by internal-fra-out-004.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 09:39:32 +0000
Received: from EX19MTAEUC002.ant.amazon.com [54.240.197.228:30618]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.16.219:2525] with esmtp (Farcaster)
 id 30bc251c-cc0a-4eef-b700-3ade75b8cf88; Thu, 28 Aug 2025 09:39:32 +0000 (UTC)
X-Farcaster-Flow-ID: 30bc251c-cc0a-4eef-b700-3ade75b8cf88
Received: from EX19D015EUB001.ant.amazon.com (10.252.51.114) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Thu, 28 Aug 2025 09:39:31 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB001.ant.amazon.com (10.252.51.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Thu, 28 Aug 2025 09:39:30 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.017; Thu, 28 Aug 2025 09:39:30 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
To: "david@redhat.com" <david@redhat.com>, "seanjc@google.com"
	<seanjc@google.com>
CC: "Roy, Patrick" <roypat@amazon.co.uk>, "tabba@google.com"
	<tabba@google.com>, "ackerleytng@google.com" <ackerleytng@google.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"rppt@kernel.org" <rppt@kernel.org>, "will@kernel.org" <will@kernel.org>,
	"vbabka@suse.cz" <vbabka@suse.cz>, "Cali, Marco" <xmarcalx@amazon.co.uk>,
	"Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "Thomson, Jack"
	<jackabt@amazon.co.uk>, "Manwaring, Derek" <derekmn@amazon.com>
Subject: [PATCH v5 11/12] KVM: selftests: cover GUEST_MEMFD_FLAG_NO_DIRECT_MAP
 in guest_memfd_test.c
Thread-Topic: [PATCH v5 11/12] KVM: selftests: cover
 GUEST_MEMFD_FLAG_NO_DIRECT_MAP in guest_memfd_test.c
Thread-Index: AQHcF/+npK+gu2tkp0adAvgbddQ75w==
Date: Thu, 28 Aug 2025 09:39:30 +0000
Message-ID: <20250828093902.2719-12-roypat@amazon.co.uk>
References: <20250828093902.2719-1-roypat@amazon.co.uk>
In-Reply-To: <20250828093902.2719-1-roypat@amazon.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_103937_178989_1A9ABEAA 
X-CRM114-Status: UNSURE (   7.06  )
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

Signed-off-by: Patrick Roy <roypat@amazon.co.uk>=0A=
---=0A=
 tools/testing/selftests/kvm/guest_memfd_test.c | 2 ++=0A=
 1 file changed, 2 insertions(+)=0A=
=0A=
diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing=
/selftests/kvm/guest_memfd_test.c=0A=
index b3ca6737f304..1187438b6831 100644=0A=
--- a/tools/testing/selftests/kvm/guest_memfd_test.c=0A=
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c=0A=
@@ -275,6 +275,8 @@ static void test_guest_memfd(unsigned long vm_type)=0A=
 =0A=
 	if (vm_check_cap(vm, KVM_CAP_GUEST_MEMFD_MMAP))=0A=
 		flags |=3D GUEST_MEMFD_FLAG_MMAP;=0A=
+	if (vm_check_cap(vm, KVM_CAP_GUEST_MEMFD_NO_DIRECT_MAP))=0A=
+		flags |=3D GUEST_MEMFD_FLAG_NO_DIRECT_MAP;=0A=
 =0A=
 	test_create_guest_memfd_multiple(vm);=0A=
 	test_create_guest_memfd_invalid_sizes(vm, flags, page_size);=0A=
-- =0A=
2.50.1=0A=
=0A=

