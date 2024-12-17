Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F631E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRwEOgnrOBB+ZQKu8dQe/bgdimJsM43RIUjPzjawoV0=; b=bJn5PNhOfelGyHPjjo6dMOUbQv
	WGHYuwJ8KQKyewpp4jfH9G6X8KCVoqUurWtEqI5UMOcazrFFHL5e5JzgPmCwWC2+74KviA/L2Am55
	Gv4N+BBeidOiMxqfv7cCPUD5Kt28mxxlc1nlfo+opZOFyHb0acxiPd+FCx8vnYSNoaqaLS9OWKuxx
	52KrsyqCjLvRJjHS88QX/Nk3bFi6UaZDa0YwPRk0iZdYMKrbXRMwXF0R0myXPSXyYGgmnc41TtG3P
	APqk4ioj5lqYbh89vagcB9+zGO40claBtJtcBdQwZQpBhRmwlGBZplLDBZfqSlZsrDCMZgE7ooXxX
	NYrgPIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXQA-0000000DX9e-1DGt;
	Tue, 17 Dec 2024 13:15:30 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXP5-0000000DX0N-00DG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:14:24 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5d4e2aa7ea9so2199953a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 05:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734441261; x=1735046061; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRwEOgnrOBB+ZQKu8dQe/bgdimJsM43RIUjPzjawoV0=;
        b=waYh8GBlkMNn4vMPFd8GUI+lyQ6IgMRv5fZoNyablmFNQeZZDT+REFX4emUGrPFnLg
         1GpefaQutNiGjuCa467ryV2qjS8u7OjFSLTCuKNYbNNcNO5Jl9DoQqN5JiJvtyevADi7
         1OX2+gpWZkOYSobjAzCT0vmwR2WbYzgt9tS70t1rGzHHDfsdh3T0G5iLunB49CIj96t0
         NUL7Pl00CyvNarZuoYCOMoBATscADHm9Gwr3/6blpJDzMgoXysBZf/w40dYtv3lGvsza
         bPcho3jWsI3+mT/1v08YHc+UOWLsYAh56ZWWGMaU0RFTWjeYySGbR9croXs5XtfPbG7j
         S5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734441261; x=1735046061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRwEOgnrOBB+ZQKu8dQe/bgdimJsM43RIUjPzjawoV0=;
        b=xHcvbXZeVJjA0CdM/QRA+JTs89HOcrk8DN4ayIgrjqDROFqB8rFKUWCo+eMfrBEced
         dEYESkOn1fNj9qdvtkj3KYT+l0y38atd4T29R8PFtAuwi1eU/BdHBleI8CUwRGatjBUY
         WzTXsB6dRzED4q7JumT85yWOvnNhaQvilSLulYRwf/yi8pfPWOjUO0Fbxz+eiRJKulHC
         WUjVaArvFwoxLuojYX25OKInxK/WAwa+MVZXwWMTEpsrVlvEJJN/yFdZHlAAVNwVEF6M
         +eSXXqP+ASu190M9HVoqaVyE1L8rNeHuCbsfUgHlGeK+JejQVRgkzsFWRivJbJDAltDo
         rWIg==
X-Forwarded-Encrypted: i=1; AJvYcCW059RKy6P+xr6M0XwUkdAESFOF/X+IRASE/l+Vns0XiKYvo2g8HnCZnicmwV5I+OdEfSxgRKtSl0bau+tklwzS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6oJC/BTAJNnkIutSwBsJwv5gv97c7fm+FQQOehOs75NuL6XOI
	OkaqU5Gi3yhP/oZSMEiRy7VLDD16uh9IOlNue+NAsehDaYeaLePc471+PRorTA==
X-Gm-Gg: ASbGncsIU0cL0B0qlX5A+vlDBdY5XcJxZWNWMOnFvKVudJd1L0u9z17FRd5F5MvgyUk
	LPzKv2+tnISXjD9yAV6XGSySIbs7wAf2VfnSC60IF8vOTO9qVw9sNEn+8YT1KjYOLdv3LOoN/rr
	mFF/V5fgBbArm+oPTKKOtyDlx9GbOCzvNkJHM8F7q/ywu5hnmAPWtzcyA8pbW1IFbCI5RdeJTKx
	pxNQV26BtScSZMzhZgnaa2t9x7+SInqGHLL0W/dzSMXdnyV0tbJ3cXSkQmitJh99iJsX3VSd5R6
	nztkQOsW4saOvRE=
X-Google-Smtp-Source: AGHT+IH5mltElk1JWkMMGj0bbNEjRXmDJL8qqfF7HW7DZRJ9qkEkQrLz3PI3FH4dCgH5rmzrjIPsIA==
X-Received: by 2002:a05:6402:3705:b0:5d2:7270:6124 with SMTP id 4fb4d7f45d1cf-5d63c3aac76mr14360142a12.23.1734441260795;
        Tue, 17 Dec 2024 05:14:20 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ad19ffsm4284077a12.24.2024.12.17.05.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 05:14:20 -0800 (PST)
Date: Tue, 17 Dec 2024 13:14:17 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/18] KVM: arm64: Introduce
 __pkvm_host_unshare_guest()
Message-ID: <Z2F5KboZewSDClKg@google.com>
References: <20241216175803.2716565-1-qperret@google.com>
 <20241216175803.2716565-12-qperret@google.com>
 <CA+EHjTxRt=XoCZbRLE1UjMg4bzgoLYD9Lh0nzmjvPZ2Q4xQOkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxRt=XoCZbRLE1UjMg4bzgoLYD9Lh0nzmjvPZ2Q4xQOkg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_051423_037741_0ED3B764 
X-CRM114-Status: UNSURE (   9.97  )
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

On Tuesday 17 Dec 2024 at 08:53:34 (+0000), Fuad Tabba wrote:
> nit: This parameter in this patch, and others, is sometimes hyp_vm, at
> others just vm. It would be nicer if it was always the same.

Argh, where specifically do you see inconsistencies? All changes to
mem_protect.c should use 'vm' consistently in this series now.

The code in hyp-main.c does use 'hyp_vm' consistently however, but
perhaps that is what you meant? I did that to follow the pattern of the
existing code that uses 'hyp_vcpu' in that file.

Thanks!
Quentin

