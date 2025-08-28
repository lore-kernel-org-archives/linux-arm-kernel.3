Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7B8C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 12:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTZ/VOJbbCjyGaq9AddgILCkPAHpmVIUuRAnTMPHRJE=; b=OFP2MCFm2HDp9sN1kr2fICoN4D
	lZur9NvAMoFFvDUIMlyBxo3wjflCRSnOC4351N63lT3HTc29TXr3C/Lzq7gOdl35mIlbrhkBXcv1l
	E5fnIhXShWEyRkwhbS4QVbvmfgBWJrQXs6tD9BAZ5pD91+LBsxcccX51wovTgNDkGmAu/Pj5tLVhG
	D1i9BoC6TV2YrJdJPOhLtScXKYJKmOJF+XlNtb9oL5O5Tmd9qcqW5+Myq256sx912cxZTdqCYRkKP
	uIXBkzKXGejEQcxuGusRH3QAIojKxb1f4kqicBl2G4NnpHiKWsI7q3xztTwFsCt0l7DgsxfxG+QXn
	beZMt4/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbzH-00000001bUF-3Nuh;
	Thu, 28 Aug 2025 12:44:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZ6c-0000000106M-1l9x
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 28 Aug 2025 09:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KTZ/VOJbbCjyGaq9AddgILCkPAHpmVIUuRAnTMPHRJE=; b=ppKFiscW07dNWKluHGOs+mOJ/Z
	x6eAk/nkLto82O4C7UzbIAr82qvREOM9lUoiYQb8KpiITASPpI5JMKeGeyFvA6K33SNpLRkO7vGrD
	LvXe6Tr8Nlgcd3ppcXOoNl2CiqkZ+8hcZm5QbPusvzV7WlIidHqvgTCwLKTP+hPNEwcYI5LWiiH3v
	+S+2zbM+WOev5Crt9Y/meUVLWee1VbOZLbjiKX646PLx3/l02cCAqkrNBPWPiWGRKaubMYCAD5LoW
	jIx93x5jyevKTH5e2J31UIIkcFMu1/g0ISuOCa5C/ZyHusQkUJQRwgIRj09WhYYfb+UFuFzdZo5iq
	hJLR+GTw==;
Received: from fra-out-004.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([3.74.81.189])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZ6Z-00000002gRB-1RCn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 09:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1756373979; x=1787909979;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KTZ/VOJbbCjyGaq9AddgILCkPAHpmVIUuRAnTMPHRJE=;
  b=NHu3KRZH0PvsVBd2op4BW6Pa4YoQs5QhSJnin6CLYlXQ4VJSyBERx3FH
   pKVbhnPSmg5rYAWDsNVcATuWm+BfiuZ4SESpHB5dQIqBvUwK86R352XOH
   ML9kKGphe5LGSVPgnzrAuLnEUdGk4uNyw/R8/tZpWEdruk1pLbqprp3yF
   2Lyi4uksVQbwy+VziYtba8bFW7I64jU9P5eAX8aDboXbyTDyun2q+DHey
   bZtSzWbSICoQnhiWPV6jWL3ULaQ2Y0XfhWM41EfPRRna4lOWKzPnoM3TJ
   BhpaKSM+JEUKRf6zrltKOyLHYE1ZZY7oY8R/t0wXb8+luOpEOYFCxKHRt
   g==;
X-CSE-ConnectionGUID: u9bjUTy6TKSekmiuaprUTA==
X-CSE-MsgGUID: 8rDPM4y3Rdeb1tmBEIF3eA==
X-IronPort-AV: E=Sophos;i="6.18,214,1751241600"; 
   d="scan'208";a="1303834"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-004.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 09:39:27 +0000
Received: from EX19MTAEUA001.ant.amazon.com [54.240.197.233:20173]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.43.161:2525] with esmtp (Farcaster)
 id f5543d0c-1ca4-4856-a828-4fcfa81cf84a; Thu, 28 Aug 2025 09:39:27 +0000 (UTC)
X-Farcaster-Flow-ID: f5543d0c-1ca4-4856-a828-4fcfa81cf84a
Received: from EX19D015EUB002.ant.amazon.com (10.252.51.123) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Thu, 28 Aug 2025 09:39:24 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB002.ant.amazon.com (10.252.51.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Thu, 28 Aug 2025 09:39:24 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.017; Thu, 28 Aug 2025 09:39:24 +0000
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
Subject: [PATCH v5 06/12] KVM: selftests: load elf via bounce buffer
Thread-Topic: [PATCH v5 06/12] KVM: selftests: load elf via bounce buffer
Thread-Index: AQHcF/+j1UnlcgO4tUakgBJ2Lj709w==
Date: Thu, 28 Aug 2025 09:39:24 +0000
Message-ID: <20250828093902.2719-7-roypat@amazon.co.uk>
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
X-CRM114-CacheID: sfid-20250828_103939_596819_48524400 
X-CRM114-Status: GOOD (  11.87  )
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

If guest memory is backed using a VMA that does not allow GUP (e.g. a=0A=
userspace mapping of guest_memfd when the fd was allocated using=0A=
KVM_GMEM_NO_DIRECT_MAP), then directly loading the test ELF binary into=0A=
it via read(2) potentially does not work. To nevertheless support=0A=
loading binaries in this cases, do the read(2) syscall using a bounce=0A=
buffer, and then memcpy from the bounce buffer into guest memory.=0A=
=0A=
Signed-off-by: Patrick Roy <roypat@amazon.co.uk>=0A=
---=0A=
 .../testing/selftests/kvm/include/test_util.h |  1 +=0A=
 tools/testing/selftests/kvm/lib/elf.c         |  8 +++----=0A=
 tools/testing/selftests/kvm/lib/io.c          | 23 +++++++++++++++++++=0A=
 3 files changed, 28 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testin=
g/selftests/kvm/include/test_util.h=0A=
index c6ef895fbd9a..0409b7b96c94 100644=0A=
--- a/tools/testing/selftests/kvm/include/test_util.h=0A=
+++ b/tools/testing/selftests/kvm/include/test_util.h=0A=
@@ -46,6 +46,7 @@ do {								\=0A=
 =0A=
 ssize_t test_write(int fd, const void *buf, size_t count);=0A=
 ssize_t test_read(int fd, void *buf, size_t count);=0A=
+ssize_t test_read_bounce(int fd, void *buf, size_t count);=0A=
 int test_seq_read(const char *path, char **bufp, size_t *sizep);=0A=
 =0A=
 void __printf(5, 6) test_assert(bool exp, const char *exp_str,=0A=
diff --git a/tools/testing/selftests/kvm/lib/elf.c b/tools/testing/selftest=
s/kvm/lib/elf.c=0A=
index f34d926d9735..e829fbe0a11e 100644=0A=
--- a/tools/testing/selftests/kvm/lib/elf.c=0A=
+++ b/tools/testing/selftests/kvm/lib/elf.c=0A=
@@ -31,7 +31,7 @@ static void elfhdr_get(const char *filename, Elf64_Ehdr *=
hdrp)=0A=
 	 * the real size of the ELF header.=0A=
 	 */=0A=
 	unsigned char ident[EI_NIDENT];=0A=
-	test_read(fd, ident, sizeof(ident));=0A=
+	test_read_bounce(fd, ident, sizeof(ident));=0A=
 	TEST_ASSERT((ident[EI_MAG0] =3D=3D ELFMAG0) && (ident[EI_MAG1] =3D=3D ELF=
MAG1)=0A=
 		&& (ident[EI_MAG2] =3D=3D ELFMAG2) && (ident[EI_MAG3] =3D=3D ELFMAG3),=
=0A=
 		"ELF MAGIC Mismatch,\n"=0A=
@@ -79,7 +79,7 @@ static void elfhdr_get(const char *filename, Elf64_Ehdr *=
hdrp)=0A=
 	offset_rv =3D lseek(fd, 0, SEEK_SET);=0A=
 	TEST_ASSERT(offset_rv =3D=3D 0, "Seek to ELF header failed,\n"=0A=
 		"  rv: %zi expected: %i", offset_rv, 0);=0A=
-	test_read(fd, hdrp, sizeof(*hdrp));=0A=
+	test_read_bounce(fd, hdrp, sizeof(*hdrp));=0A=
 	TEST_ASSERT(hdrp->e_phentsize =3D=3D sizeof(Elf64_Phdr),=0A=
 		"Unexpected physical header size,\n"=0A=
 		"  hdrp->e_phentsize: %x\n"=0A=
@@ -146,7 +146,7 @@ void kvm_vm_elf_load(struct kvm_vm *vm, const char *fil=
ename)=0A=
 =0A=
 		/* Read in the program header. */=0A=
 		Elf64_Phdr phdr;=0A=
-		test_read(fd, &phdr, sizeof(phdr));=0A=
+		test_read_bounce(fd, &phdr, sizeof(phdr));=0A=
 =0A=
 		/* Skip if this header doesn't describe a loadable segment. */=0A=
 		if (phdr.p_type !=3D PT_LOAD)=0A=
@@ -187,7 +187,7 @@ void kvm_vm_elf_load(struct kvm_vm *vm, const char *fil=
ename)=0A=
 				"  expected: 0x%jx",=0A=
 				n1, errno, (intmax_t) offset_rv,=0A=
 				(intmax_t) phdr.p_offset);=0A=
-			test_read(fd, addr_gva2hva(vm, phdr.p_vaddr),=0A=
+			test_read_bounce(fd, addr_gva2hva(vm, phdr.p_vaddr),=0A=
 				phdr.p_filesz);=0A=
 		}=0A=
 	}=0A=
diff --git a/tools/testing/selftests/kvm/lib/io.c b/tools/testing/selftests=
/kvm/lib/io.c=0A=
index fedb2a741f0b..74419becc8bc 100644=0A=
--- a/tools/testing/selftests/kvm/lib/io.c=0A=
+++ b/tools/testing/selftests/kvm/lib/io.c=0A=
@@ -155,3 +155,26 @@ ssize_t test_read(int fd, void *buf, size_t count)=0A=
 =0A=
 	return num_read;=0A=
 }=0A=
+=0A=
+/* Test read via intermediary buffer=0A=
+ *=0A=
+ * Same as test_read, except read(2)s happen into a bounce buffer that is =
memcpy'd=0A=
+ * to buf. For use with buffers that cannot be GUP'd (e.g. guest_memfd VMA=
s if=0A=
+ * guest_memfd was created with GUEST_MEMFD_FLAG_NO_DIRECT_MAP).=0A=
+ */=0A=
+ssize_t test_read_bounce(int fd, void *buf, size_t count)=0A=
+{=0A=
+	void *bounce_buffer;=0A=
+	ssize_t num_read;=0A=
+=0A=
+	TEST_ASSERT(count >=3D 0, "Unexpected count, count: %li", count);=0A=
+=0A=
+	bounce_buffer =3D malloc(count);=0A=
+	TEST_ASSERT(bounce_buffer !=3D NULL, "Failed to allocate bounce buffer");=
=0A=
+=0A=
+	num_read =3D test_read(fd, bounce_buffer, count);=0A=
+	memcpy(buf, bounce_buffer, num_read);=0A=
+	free(bounce_buffer);=0A=
+=0A=
+	return num_read;=0A=
+}=0A=
-- =0A=
2.50.1=0A=
=0A=

