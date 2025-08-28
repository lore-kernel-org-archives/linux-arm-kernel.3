Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C7CC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 12:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GKsQpLhDwEigIcg6L6Ns++AnIJyQDate+xl8DCsoZg=; b=FokXwtfGhxFu27DWp4ht8ZTQ+8
	8GdAQntol8nRmP2Qo0/m7Jzhp+Xtt5FZ5sf+M2tV3Mhp/IyGUbBjKQersntvaCt0TaOdRj+A8DLq4
	jUJgRa/8Xymmpn9MzUrucgvGTSFIu8KWErXUY+iQzCYukjfH8ES1BXLPfrcZcZqkA4qyGlluaLAA7
	F+ypLV1xckcKRQWUaiptiTwLaN5Bl1Vaxll2fClhhyNCOZMrAH+Kh9XBpGvNFyUvNRWxnoLXnkszH
	XojT7WYWCaNKE3OzYp/4UjOkegLb8RTdnVEg1/n6nIPYfnjRrJiwqBI+QVkmlc0WIQXgYuGiNqc6f
	DqSY6cYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urblt-00000001YZA-3q1F;
	Thu, 28 Aug 2025 12:30:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZ6V-0000000104G-2YCc
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 28 Aug 2025 09:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2GKsQpLhDwEigIcg6L6Ns++AnIJyQDate+xl8DCsoZg=; b=q1Alvs563+b0BKFz5VjhRT9KNZ
	1BxPm0bIo0VwikaJYwBDYVS+lP3iQalGR+ewwCcfT6F6gWL6n5IUo7nvbOv9OVATf2ue3AAwPbb3f
	aH0USNYqPeCx9Xnn9DvtYS/ueDdZq3fHfoss4TKKPnsxxZuQ9yR+bhFrJpkYXclH2YE2n5ecdFvJP
	IxP7OmQupt8+lps2/5bn9Yf4cE6pSY+RV7m7+ECLUuWOGUcDMx8ODyYydKBgQ0hGB6NrJ+6wLHSOj
	SFmwJ7ts3k4U5EKj4//VUOxKmxMEFa4LJLjwOyAuto1jUb4QRGsMO/e6+C8R8kiSyQ95VTUC8MjWR
	0VLa4GUw==;
Received: from fra-out-008.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([35.158.23.94])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZ6S-00000002gPE-3MGz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 09:39:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1756373972; x=1787909972;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2GKsQpLhDwEigIcg6L6Ns++AnIJyQDate+xl8DCsoZg=;
  b=EJzTq6dBkO/j9GB3ixvOul4K7x0zl0awWInyaiS1ebD4AcFqwTTND/+W
   CGbZGe8OKpwBjUbvetffmc4DPSjtPNRwspreKQ43c4goCNsT867DIS03o
   gx3gSCgk0ZhUpSjEIxZfjzFO87Yybl1DDcd1rFbcQishcUIvIE9+JU4Py
   0o/35RAJIpRuudXeDjOy+L3YOB6pw30l4pfTJ5aVcUf4q7cYnimdjqpw4
   j/syJnom+Op+aJiE2pnT5DsJSS05oOxQ4KOd6t3bnquio3U+cnKUHfgI6
   SpLCCnbr3TxX+GUSDtkamPSOiBKSM++yS3OuSd5j0aZbUunCRojlTW80l
   g==;
X-CSE-ConnectionGUID: lWd8i2WJRJqgu4AJCZSeLQ==
X-CSE-MsgGUID: EUKWcsB7TEWoNzzYRDs/cA==
X-IronPort-AV: E=Sophos;i="6.18,214,1751241600"; 
   d="scan'208";a="1303840"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-008.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 09:39:31 +0000
Received: from EX19MTAEUA002.ant.amazon.com [54.240.197.232:30454]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.42.3:2525] with esmtp (Farcaster)
 id b6128983-88e8-4af1-9711-47b2713193ad; Thu, 28 Aug 2025 09:39:31 +0000 (UTC)
X-Farcaster-Flow-ID: b6128983-88e8-4af1-9711-47b2713193ad
Received: from EX19D015EUB002.ant.amazon.com (10.252.51.123) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Thu, 28 Aug 2025 09:39:28 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB002.ant.amazon.com (10.252.51.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Thu, 28 Aug 2025 09:39:28 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.017; Thu, 28 Aug 2025 09:39:28 +0000
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
Subject: [PATCH v5 09/12] KVM: selftests: stuff vm_mem_backing_src_type into
 vm_shape
Thread-Topic: [PATCH v5 09/12] KVM: selftests: stuff vm_mem_backing_src_type
 into vm_shape
Thread-Index: AQHcF/+lpVChiqeOEU2vKPY3yGmqIQ==
Date: Thu, 28 Aug 2025 09:39:28 +0000
Message-ID: <20250828093902.2719-10-roypat@amazon.co.uk>
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
X-CRM114-CacheID: sfid-20250828_103933_029139_83869A52 
X-CRM114-Status: GOOD (  10.19  )
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

Use one of the padding fields in struct vm_shape to carry an enum=0A=
vm_mem_backing_src_type value, to give the option to overwrite the=0A=
default of VM_MEM_SRC_ANONYMOUS in __vm_create().=0A=
=0A=
Overwriting this default will allow tests to create VMs where the test=0A=
code is backed by mmap'd guest_memfd instead of anonymous memory.=0A=
=0A=
Signed-off-by: Patrick Roy <roypat@amazon.co.uk>=0A=
---=0A=
 .../testing/selftests/kvm/include/kvm_util.h  | 19 ++++++++++---------=0A=
 tools/testing/selftests/kvm/lib/kvm_util.c    |  2 +-=0A=
 tools/testing/selftests/kvm/lib/x86/sev.c     |  1 +=0A=
 .../selftests/kvm/pre_fault_memory_test.c     |  1 +=0A=
 4 files changed, 13 insertions(+), 10 deletions(-)=0A=
=0A=
diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing=
/selftests/kvm/include/kvm_util.h=0A=
index 5204a0a18a7f..8baa0bbacd09 100644=0A=
--- a/tools/testing/selftests/kvm/include/kvm_util.h=0A=
+++ b/tools/testing/selftests/kvm/include/kvm_util.h=0A=
@@ -188,7 +188,7 @@ enum vm_guest_mode {=0A=
 struct vm_shape {=0A=
 	uint32_t type;=0A=
 	uint8_t  mode;=0A=
-	uint8_t  pad0;=0A=
+	uint8_t  src_type;=0A=
 	uint16_t pad1;=0A=
 };=0A=
 =0A=
@@ -196,14 +196,15 @@ kvm_static_assert(sizeof(struct vm_shape) =3D=3D size=
of(uint64_t));=0A=
 =0A=
 #define VM_TYPE_DEFAULT			0=0A=
 =0A=
-#define VM_SHAPE(__mode)			\=0A=
-({						\=0A=
-	struct vm_shape shape =3D {		\=0A=
-		.mode =3D (__mode),		\=0A=
-		.type =3D VM_TYPE_DEFAULT		\=0A=
-	};					\=0A=
-						\=0A=
-	shape;					\=0A=
+#define VM_SHAPE(__mode)				\=0A=
+({							\=0A=
+	struct vm_shape shape =3D {			\=0A=
+		.mode	  =3D (__mode),			\=0A=
+		.type	  =3D VM_TYPE_DEFAULT,		\=0A=
+		.src_type =3D VM_MEM_SRC_ANONYMOUS	\=0A=
+	};						\=0A=
+							\=0A=
+	shape;						\=0A=
 })=0A=
 =0A=
 #if defined(__aarch64__)=0A=
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/sel=
ftests/kvm/lib/kvm_util.c=0A=
index a81089f7c83f..3a22794bd959 100644=0A=
--- a/tools/testing/selftests/kvm/lib/kvm_util.c=0A=
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c=0A=
@@ -495,7 +495,7 @@ struct kvm_vm *__vm_create(struct vm_shape shape, uint3=
2_t nr_runnable_vcpus,=0A=
 	if (is_guest_memfd_required(shape))=0A=
 		flags |=3D KVM_MEM_GUEST_MEMFD;=0A=
 =0A=
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, fla=
gs);=0A=
+	vm_userspace_mem_region_add(vm, shape.src_type, 0, 0, nr_pages, flags);=
=0A=
 	for (i =3D 0; i < NR_MEM_REGIONS; i++)=0A=
 		vm->memslots[i] =3D 0;=0A=
 =0A=
diff --git a/tools/testing/selftests/kvm/lib/x86/sev.c b/tools/testing/self=
tests/kvm/lib/x86/sev.c=0A=
index c3a9838f4806..d920880e4fc0 100644=0A=
--- a/tools/testing/selftests/kvm/lib/x86/sev.c=0A=
+++ b/tools/testing/selftests/kvm/lib/x86/sev.c=0A=
@@ -164,6 +164,7 @@ struct kvm_vm *vm_sev_create_with_one_vcpu(uint32_t typ=
e, void *guest_code,=0A=
 	struct vm_shape shape =3D {=0A=
 		.mode =3D VM_MODE_DEFAULT,=0A=
 		.type =3D type,=0A=
+		.src_type =3D VM_MEM_SRC_ANONYMOUS,=0A=
 	};=0A=
 	struct kvm_vm *vm;=0A=
 	struct kvm_vcpu *cpus[1];=0A=
diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/te=
sting/selftests/kvm/pre_fault_memory_test.c=0A=
index 0350a8896a2f..d403f8d2f26f 100644=0A=
--- a/tools/testing/selftests/kvm/pre_fault_memory_test.c=0A=
+++ b/tools/testing/selftests/kvm/pre_fault_memory_test.c=0A=
@@ -68,6 +68,7 @@ static void __test_pre_fault_memory(unsigned long vm_type=
, bool private)=0A=
 	const struct vm_shape shape =3D {=0A=
 		.mode =3D VM_MODE_DEFAULT,=0A=
 		.type =3D vm_type,=0A=
+		.src_type =3D VM_MEM_SRC_ANONYMOUS,=0A=
 	};=0A=
 	struct kvm_vcpu *vcpu;=0A=
 	struct kvm_run *run;=0A=
-- =0A=
2.50.1=0A=
=0A=

