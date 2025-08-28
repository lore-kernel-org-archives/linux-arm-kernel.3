Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B499DC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 12:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0IDH9n28kEwYt0ECrfeYfhTLW/JDV2HhZTsdNRyHePU=; b=BmnIn6r8cEvUP/coFBGthtTQ8b
	ItyvvYfcNaqE3B1QHN1KihoP+ZF6hCx79NC3S+v1cHQu7ixZBVnElAlwutuJNvk1OVL7SRJpSGp00
	ne0HeB9BfKyQz0QCZyY9N/mwFK2LG0QTR74IU/2+ck4XLAlm9pLS7R9lJ8+Gta1J/3qC8wzIqe2um
	BUGUofnQ1MnfG89rtLuL8UJYuzj7ZUBDqTN2331AWJ4ubLpvHsd1tevxlL6aBewBsYR3OAiNJdO3Y
	0nDZScXcLkt08p2BuxyGz7bq+KmWLmRDFtg0GLYsqe6XmVV91XLMEa28uJhnh3A+Gue0OVhP1w9Qi
	8ATrpsJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbrD-00000001Zh3-2cDE;
	Thu, 28 Aug 2025 12:35:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZ6W-0000000104n-2fpL
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 28 Aug 2025 09:39:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0IDH9n28kEwYt0ECrfeYfhTLW/JDV2HhZTsdNRyHePU=; b=F7cCePBIQJ7m1gNKmyi4NRVa2n
	r4/HSaDdAc3qTv3+OoWn9f9R2AxYdWTPF2UOVzG06KqW19NX2Fls9yi8OLlJWhqCWdkcxwmFw3qZl
	tGw2otCp2tJ3ttn8s6TXrth8VTkFJnVUMl9BArHXagM4OG/CtNzRdLcZC/PAnGHRotrxp3gIAHTEj
	2ur2LcF7eJth9Tf7if6hbAmVlKQQh0VfdwgEYuWnvtwgwWyn9jrhrfJaHd77IiGyZu2AxEUoKlAyr
	iEzpcpOdbhedgG70Bc3FjxvtNi4cf0+fBKxW7ciyHbHKlujgihbj31kENOsRPZrgTe80eGgHDkH8Q
	EOFNEpgQ==;
Received: from fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([63.176.194.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZ6T-00000002gPo-3b5U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 09:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1756373973; x=1787909973;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0IDH9n28kEwYt0ECrfeYfhTLW/JDV2HhZTsdNRyHePU=;
  b=MkguuVHqaCYEYXHTXZFupDOWCoAATBS4bDgAbGUlLXMXzxPZsTI9Gacz
   r0Hj6wDHdURyaMpKZhBHUMtrh2ZrBLm2fvdcTiYqetLsUIjwZDt3zTXhF
   6QMOzAXJKMpGj/eF8ieBXA2zFZEubnba1rofdD+PFx03OCxNoFqx6Pr1I
   uhtkZlTy8ux2wBUlXkoLUuCH0vntPPXnThV+fG/fDAUuxJeM+2tWWt1Dl
   EwlKfwB2wpimxJNoM9WvbQ8h1FVdNGO9vQYFq1935/M19mfGRHZmUVA4p
   6PJKEk8blD+B+m4UFkpd3QRPiqguo9fBpogs09l0epWCImYk78zr223jM
   Q==;
X-CSE-ConnectionGUID: StAVDOr1TDqzrpf/UacFbA==
X-CSE-MsgGUID: 62wxrjsZSS6115niAVDpqQ==
X-IronPort-AV: E=Sophos;i="6.18,214,1751241600"; 
   d="scan'208";a="1301811"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 09:39:24 +0000
Received: from EX19MTAEUB001.ant.amazon.com [54.240.197.226:10411]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.18.194:2525] with esmtp (Farcaster)
 id cf079725-5cad-40a9-99e7-2d92fc48a8df; Thu, 28 Aug 2025 09:39:23 +0000 (UTC)
X-Farcaster-Flow-ID: cf079725-5cad-40a9-99e7-2d92fc48a8df
Received: from EX19D015EUB001.ant.amazon.com (10.252.51.114) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Thu, 28 Aug 2025 09:39:23 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB001.ant.amazon.com (10.252.51.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Thu, 28 Aug 2025 09:39:23 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.017; Thu, 28 Aug 2025 09:39:23 +0000
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
Subject: [PATCH v5 05/12] KVM: Documentation: describe
 GUEST_MEMFD_FLAG_NO_DIRECT_MAP
Thread-Topic: [PATCH v5 05/12] KVM: Documentation: describe
 GUEST_MEMFD_FLAG_NO_DIRECT_MAP
Thread-Index: AQHcF/+iTh4+SyN+qUqFXrn8N9N71g==
Date: Thu, 28 Aug 2025 09:39:22 +0000
Message-ID: <20250828093902.2719-6-roypat@amazon.co.uk>
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
X-CRM114-CacheID: sfid-20250828_103934_051674_21CB58AF 
X-CRM114-Status: UNSURE (   7.67  )
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
 Documentation/virt/kvm/api.rst | 5 +++++=0A=
 1 file changed, 5 insertions(+)=0A=
=0A=
diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rs=
t=0A=
index c17a87a0a5ac..b52c14d58798 100644=0A=
--- a/Documentation/virt/kvm/api.rst=0A=
+++ b/Documentation/virt/kvm/api.rst=0A=
@@ -6418,6 +6418,11 @@ When the capability KVM_CAP_GUEST_MEMFD_MMAP is supp=
orted, the 'flags' field=0A=
 supports GUEST_MEMFD_FLAG_MMAP.  Setting this flag on guest_memfd creation=
=0A=
 enables mmap() and faulting of guest_memfd memory to host userspace.=0A=
 =0A=
+When the capability KVM_CAP_GMEM_NO_DIRECT_MAP is supported, the 'flags' f=
ield=0A=
+supports GUEST_MEMFG_FLAG_NO_DIRECT_MAP. Setting this flag makes the guest=
_memfd=0A=
+instance behave similarly to memfd_secret, and unmaps the memory backing i=
t from=0A=
+the kernel's address space after allocation.=0A=
+=0A=
 When the KVM MMU performs a PFN lookup to service a guest fault and the ba=
cking=0A=
 guest_memfd has the GUEST_MEMFD_FLAG_MMAP set, then the fault will always =
be=0A=
 consumed from guest_memfd, regardless of whether it is a shared or a priva=
te=0A=
-- =0A=
2.50.1=0A=
=0A=

