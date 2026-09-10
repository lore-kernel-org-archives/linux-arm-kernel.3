Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A43AC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 06:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TP/7+E4rrU+pDYrVqTFosm4KeNM9JoqKXMfQYJNgxAE=; b=b8mh2KohHdg6afNN5lyEe9Q1+T
	ko+M6yBsql3ftJbRI/IYVEeqY7TjUuy1b/ThbwMhywrLqtmNzHAj0ytt7WQ0lQE3GuH2YWgYliFrC
	fsILwCFqIlusuqv8ZRbR06EyFnDQRWCz7wlOlI/KYkTugP8Oiu5fPpAbhapP3gWuvq3sqpnWj3kMj
	GmjfqQ9MZStfuiuucVIgTYqd90/JPfGEqK4D8JbOtt5QLcd2jD0fyyYoLlhuJnsUXA9GvxgvDSFpD
	mgAunEUuEN4JV1flVnYJvv/D6TJbAwTKteykkhX8y2GaZ1VqTGPk7soyXPKf4ONhdhkEVRRNytZRv
	MymuQlZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YQx-0000000DY4I-1z77;
	Thu, 10 Sep 2026 06:38:55 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YQv-0000000DY3G-0RbC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 06:38:54 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2d6f9e2f681so76470335ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 23:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022332; x=1789627132; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TP/7+E4rrU+pDYrVqTFosm4KeNM9JoqKXMfQYJNgxAE=;
        b=cUALl9sDGpTVb7tdoRnaQmA3P0fyyFdpkoC12SODCoSB1d01qIgYoYesKyZj0ckgvg
         z+Jc3h41CewM13PuW+ddnXE/W5UsBFxL5jWtONDUt2UFPfnzg55teSxPR7szjuSUr3cv
         r91pmyWBR/2PDVRHftBbvsRxxfvwL03c4pCFJGgmXWIjeAeoiMAZ9inScVrUqy4rzmOg
         9JzPFFXGmaEGDIHiBFr7hbklXvjBcqowVtE5g/b0aq6F1nmftmuwC6YIQO49r3bEekx9
         FhspB1a/97vay4AgLM2GjPRqqP4jlyoKu3ypz5VxVpL3cJjWk4kj+Aojdz/5bLHKR4N1
         MrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022332; x=1789627132;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TP/7+E4rrU+pDYrVqTFosm4KeNM9JoqKXMfQYJNgxAE=;
        b=S0HNC8z1I0JH/e1S/l7dfmm+q2x7h8RtATnKyQilkOwU8egU1OXCOmbFGyhOFh8Oea
         VRptCUGT3U1RiMHJENiGrXqyGv/PQ+s5OAAlzCtRnMHGeDKYMILKhLlPKU8YwfmGPd6x
         lU08qs7DhoWHQUMvWe+/hPxq0NJfhYnZ6/Z9vOs+nu8PkuKfiVwDAY+jx8tfBjHFOTZi
         qmaMrRJE2sDnlnoVIJZA15UaIcjmbOf4L445w1armb1fa/eOjCxqeW5BGteNJagUDVDh
         uE+K5yMeB4fRRX8vvkBuMxxZo3Nbha4rj0zkZ+XxgPLErvGpzG27m9H4kxSObGaCWE/Z
         tzlQ==
X-Forwarded-Encrypted: i=1; AKwUvByuvFg/pv6zHHzfGMkrEPh1eTnjLROPVAZwu5fekXOYkDyvmBG/E/Z1KK4Rjs+W02VDnP3mVoAJr+bUZ0DSoowH@lists.infradead.org
X-Gm-Message-State: AFuF++lRlFO2HER96IyVx2AlAyEMq7c2KMhUihxR921eWrqoIclRSTGl
	0i95Tb8pLjKl7h6atIgU9B2qmvnMNQJU8n1EQP/NppsiPWTmzAYgoaiY
X-Gm-Gg: AYBFou26jZH4nr84Q5EIDMsHcWMvfIUGzfYF7XNZDv3m10ujIqJnlgzIw0D5hYJVkS+
	UZwPiAshMLle57Q/YwGBVYtgCAwk+d+3qWiRObeN256JiZSlhqnQ5AJAauU/fTlHVPBjSUDblPj
	CXZcf74SzgPS9W9ekueRPufcT+wPyIr9PshwVJ4atYHfkgOYkXTgm/3U6dQfc40y2BbHWp6lkZM
	3O39CntoN2TiXHlW88AusxHZlzwX6PCV3r24q/FHSG/AGVYOsCWXav31rajlP1JbXUZjmELJCgH
	tM5A5sXUJVfHauxE82fGOT146jneFJ9swdnK7pSnvaP8uwhoUNcgDcWk05+grON+GBOkD94xjoI
	dhbGVP1sTecGfOthcawXtogvVfuEVG7sRl2wy0bPlAQoSO0t4q6Z/UVy0Y/eW0u9eqRI+XBZVDs
	eyiPcMmu5Q94FX5/KPqJ+cpBFseJHQQbQiT3+XO7CvaUGH5MimxYrTdlqF4X82hTfxGUyM+bRvw
	Wv+7ZA0mlJTbmbEA/DXmBHOuZJ7SwP/2CYBvV6Z43tQ81qkw7+28JLpySqNuDtXXw==
X-Received: by 2002:a17:90a:2c9:b0:39b:2b5a:8dc5 with SMTP id 98e67ed59e1d1-39b2b5a9b24mr38222127a91.6.1789022332072;
        Wed, 09 Sep 2026 23:38:52 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm10464300eec.20.2026.09.09.23.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:38:51 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 07/20] KVM: selftests: Make the single-page allocator APIs static inline
In-Reply-To: <20260902164123.2546762-8-seanjc@google.com>
Date: Thu, 10 Sep 2026 12:06:11 +0530
Message-ID: <ecf11ulg.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-8-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_233853_146746_90861C09 
X-CRM114-Status: UNSURE (   6.89  )
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

Sean Christopherson <seanjc@google.com> writes:

> Move the single-page allocator APIs to kvm_util.h as inline functions, as
> the are trivial wrappers, and unlike __vm_phy_pages_alloc(), are expected
> to remain that way for the foreseeable future.
>
> No functional change intended.
>
> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

LGTM. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

