Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBFCCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdlTsQZNNrmq7u3Z5M5rk595Ss//u8ZKePXJNnxhb1o=; b=diBW7sx8iTngsDYVw5vWZqY0zN
	gTGy5/4HDk0Aq2tjRVjVJeVmooYvYJVlHIGJH3VGeNRW16Wlrzfyx0sO6bDDA8M4VRqa5wjNJfj74
	ux/tRtQ59dSxlnhhBTa0XZ3bR4yQOxCJISSjNOri6cCYo52prFw6ZqWWFkYNyd1BxeBXLT+acJgF4
	h5Of2cp1rUEsjn4JhYhqblMSUuIofkrTfxHagTg541Lk7HSkNTTiQUD9+QvmJq8w3M8TFv2+ZqMEg
	iOywYj40xhjCuL/VNTNidJ0I9GhAQVaI9Xv/r2oBY536gWIcLJHn37FSezPUN+YvYgr5RJyMNgC24
	dUweDczw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urITJ-0000000G3ZM-3Woh;
	Wed, 27 Aug 2025 15:54:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urFwD-0000000FX4G-2TV4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 13:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756300299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YdlTsQZNNrmq7u3Z5M5rk595Ss//u8ZKePXJNnxhb1o=;
	b=KsgBNfjf/C56wKrrAjdzI5LbfhlMU38iWjWx6KYJORwj0yBnRxCOE0jvg8f+rcn27VTf/A
	W/svys0LiBziZxYu7G8/kmoOGvjhUq38x6PF6ha8rCyQpTq9Lr727w95QjhmARW0LXR9oo
	RCTe3og5vBfajyT6VycaACforChRojU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-w7zidPKkNJSY__dpWYitoA-1; Wed, 27 Aug 2025 09:11:37 -0400
X-MC-Unique: w7zidPKkNJSY__dpWYitoA-1
X-Mimecast-MFC-AGG-ID: w7zidPKkNJSY__dpWYitoA_1756300297
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3cc3765679fso449341f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 06:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756300296; x=1756905096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdlTsQZNNrmq7u3Z5M5rk595Ss//u8ZKePXJNnxhb1o=;
        b=RUcE47s932uHzk/qjm0xOMWOjZqhwiHpu5gxMKVB0kK2VDFJhacvLqaAtMx2RkVflP
         uHwJc+zfCTt0SYY7AJEQRpIjoxOn4ZCg9+xSL7/3rk5hKR/fxbmyWV+W1Z/K6t6mi6pn
         KQ6gp4fqh4qegqybQYKzzaoVqvJVxbeOhoTv+rViPLNdCSUQKsQqZqRSiU6dK8P8eOAj
         eO5DHbk4bZCf3XwwzvnnOkthkYYFWN+DpRv5cKfRtA2AUvCd5RBWohCYsqNm7/TRnKY1
         iOQfc969/xvj17GsiloT2xu3rC/UUdF7MpydYlPADMK3DTS4xLBHIPOD82yybtj1blWs
         QzNg==
X-Forwarded-Encrypted: i=1; AJvYcCXUyLrQiodwLcyP7NcJGRQ2G/qGRSDzSRH1LUf7sy3iAFE4gLxi4BxoT63U57iVDHUDo1x2W+5hUTrd8WTHWJp9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9V/HN0tXBxG2Qq0AgWao2UYNFWOvfPa3NR41ezQUBNLNe8aLb
	Nnno83Vd0Ez1c4H9yz5EL3ni27SbZA3XByfDSDREwfDl74Y3EzF1UdC801O3MqA9Ff4EserxMvv
	dkhKVL/auRXw5tj17jkWzz5xrCSMoDHCu3twqVrJs4qnZFztwUoA2uEtrSr6GE0GETWh2tC72Yu
	zwsOR5FfkyIKGL4fzv1cI5a9XQCgId0PQqLvL1NI5wbEdc1y8Lh2k=
X-Gm-Gg: ASbGncuNOJn03bbgL89wS4QGW2Z0u7PT1+9OYIKDJOmsye4TozvDZtnb8jnEa7WiJBa
	h2q5dZAA/qX/2dGy3iLD6qfvBJ/CxOI3I7GY9MqMEHWR3gcnXGJJLaQA3z0oH6vGaRBWIr8szYs
	6K7OZN6cDwBo0n1bTpLLzcvib2NS8o6ZI1R5v4f2IFLMnq6SS+KI1Ji5zLSI1dZiqBCzwsnSiBN
	rJDVfm/zlwZB/ltvUoRPNVv
X-Received: by 2002:a05:6000:144f:b0:3c8:6b76:2ee9 with SMTP id ffacd0b85a97d-3c86b7633cbmr9046542f8f.19.1756300296497;
        Wed, 27 Aug 2025 06:11:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIu95W78Kd2FcqoAMBmRWc50Pfjv6n3rRZIWnWs3jErMyKSztWJGNEOWQHM3H1SLdXfBJS+ZjUc6qHuPBUxAQ=
X-Received: by 2002:a05:6000:144f:b0:3c8:6b76:2ee9 with SMTP id
 ffacd0b85a97d-3c86b7633cbmr9046516f8f.19.1756300295999; Wed, 27 Aug 2025
 06:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com> <87b10d94-dca2-4ecb-a86f-b38c5c90e0cf@redhat.com>
 <86frdcewue.wl-maz@kernel.org>
In-Reply-To: <86frdcewue.wl-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 27 Aug 2025 15:11:22 +0200
X-Gm-Features: Ac12FXyek3cfAXJUDvWryX-P1WU7M6mjVSZlZC6o5IXedOpceLYmHnNxWJaWG74
Message-ID: <CABgObfb21UEZf4aQVv_-v3uFCp08G3SWhoTbpmSFz7qL0Xm63w@mail.gmail.com>
Subject: Re: [PATCH v17 00/24] KVM: Enable mmap() for guest_memfd
To: Marc Zyngier <maz@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Oliver Upton <oliver.upton@linux.dev>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BvweP5sxAz6v7wYCvllFCNrM3mZle9ZDOp3ycj65wU8_1756300297
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_061141_700537_D784F890 
X-CRM114-Status: GOOD (  10.49  )
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

Yo can

On Wed, Aug 27, 2025 at 3:08=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Wed, 27 Aug 2025 09:43:54 +0100,
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> > Applied to kvm/next, thanks!
>
> Can you please create a stable branch for these patches? It is quite
> likely that whatever I queue for 6.18 will conflict with that, and I'd
> like to be able to resolve the conflicts myself.

You can just base kvm-arm/next on kvm/next, but if you prefer I pushed
guest-memfd-mmap at https://git.kernel.org/pub/scm/virt/kvm/kvm.git/.

Paolo


