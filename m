Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E717D44C66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 15:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJosCagNxl42FnOET8OWwknghA7dpDe3mYQUJhuz+b4=; b=Z6/Rkl8K+6ZkshU6t9jFCcCaQM
	2Ioj3HNilg4N6b/Y728XfPtlC7RLjH8wOZc7s3r6rmXF0omNaToImw3elPfEGxKer5h00XdXwYPyp
	2IMEy0AipGvPLf6yZpB6xCEFRAFfUrfECDObzfTLblcPnQ9Cts7tare86cfgbeJp1FW0RncUgPxyz
	lG+XCbq5puyf4QQ3yrKUBLfkpIMg791Cx/rz2nbbgWtFuGISdl5btuD81FGF+g0BFqrtrJBm7ylwj
	NQs0thj3GQsoN8Qe/g4+vNL7F9DtTwZTJX6gvVR/bmkSm/46IJYrlFhpDzdEX0qTs8mlkgl7TYsA5
	8jpNbdDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgPbN-0000000CcRe-01jC;
	Thu, 15 Jan 2026 15:49:37 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgPbK-0000000CcRF-1goS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 15:49:35 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-653781de668so1565325a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 07:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768492172; x=1769096972; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJosCagNxl42FnOET8OWwknghA7dpDe3mYQUJhuz+b4=;
        b=pJl9CpMnEMwC22hZHQ5O3BDlrAbGH4PlWImPnm0dnjkbtK1vsFk3I/RtimZ5J5/nTz
         MD7FlfauS+78mMDJ0Yg15Yzxo48bZvCtSMwJf1zaf3SuRiz5KdVRxIKktfE/TE+W3mjx
         RwUCRlSvEM86R+W+FiPs1xgEDfDcjcTTaUtGRW6Vuw5fy0oZYpZRY9l79lCk+r2XPW/t
         mH4HieIpGlepUwU3EGoTUxWjPmXeIgeYkM2/M+ENWNYfPHQXkciXJJ4YVpLV/47UK2W5
         RlLgSO6OzHT01fCtgLOnJMo0L4I5R9PAsHZquh55bLVru3r1iOTyX/4O7TddGr7ZoK6/
         R/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768492172; x=1769096972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DJosCagNxl42FnOET8OWwknghA7dpDe3mYQUJhuz+b4=;
        b=Or/gG2uUjr1L3Ilhvw1y+3USjidR/GRGA6Yd1wP5ryIqptIqIYltYa5f8AKZyQzlJb
         pj8hwTN5Q/+NDN8XdrUymjD7AfEtoSYqzk0091YboD/R/Ma0gktYgvphkOGn2Wo0uBh3
         w7Y/y4t4z4c0XkFvwSw1psDV/4cXVLCaYe1+M0ShIcqNdax7PHIMHw3plspLLgUnRWeH
         d3+OIlyQTbNb2OfAKBAU53RfXtIrt6v4TK4S5QYrSrTHg5P84gHbg3u0+7zAFu92jwWY
         p5EwpDdol3Adng+Hok61v3vN5LTRYY0eNabnim+a72/K4hV5eojEjlwOmrOagzuc96Ca
         B+AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ4bFlj4MYHR5f5nBVv8AGvhcwDaLhIivVIV3ngPVx5IFAUOym5nfNJNVxds8CbkT3JQzZxr5QNeuco1fgypHj@lists.infradead.org
X-Gm-Message-State: AOJu0YzAAcNiHM5jzZm9LDMCNEhObfhE7Tuif5HlL3XWOFNoeSue6GzK
	p/Wavz4SBXvlu5pgIwHi2O3C31rSFL7EOGWSrsw3SjF9Neun8JqtGhMwrx/RY+O2CsAledsq5Ye
	GECWe0hL3fzAXTOQ/zwARdyVnf/tHl77NKeJGsEug
X-Gm-Gg: AY/fxX76oGYNMaEyhpWasZaes6v1ZS6TwniVxydFFkYwDe/H21X6qM+mgH7DZTQL8YT
	PPaq5MvbLQgleC+t0MJbRsy3Uj5GXGp8pnsQR+gfwd7fPLRmxZa/7s2/y2AlkAKCFgSzyn798rZ
	TMGccA0N7F+ArK4eHW7VZLKPTr1u6ZvwFw5YHv3wEFA+8WgEInMDlDIq76aEXL4UfFT6U5NPMmi
	s6DLIH+Sl8H/KN+l5IkIQVw5aue650fmWJ9RpmBO62OVdbtzeBwbeKNpjKVTGvGMKxRT/gj+fmJ
	e9aGkOAPQqNn7sy+VAUkEt+zExT6wW9YCzfZ
X-Received: by 2002:a17:907:7201:b0:b73:4d06:bc8 with SMTP id
 a640c23a62f3a-b8793038b15mr3226666b.53.1768492172042; Thu, 15 Jan 2026
 07:49:32 -0800 (PST)
MIME-Version: 1.0
References: <20260112165914.4086692-1-ben.horgan@arm.com> <20260112165914.4086692-30-ben.horgan@arm.com>
In-Reply-To: <20260112165914.4086692-30-ben.horgan@arm.com>
From: Peter Newman <peternewman@google.com>
Date: Thu, 15 Jan 2026 16:49:20 +0100
X-Gm-Features: AZwV_QgJIFOY7mytVZj-oToaIVE2HXo1QdZ-MKrOSwI7DjzIv776hEYevEscmU0
Message-ID: <CALPaoCh+mRLJEfhKBve3hRf+vHHoObjvWRt74OfpopgtR9g9FQ@mail.gmail.com>
Subject: Re: [PATCH v3 29/47] arm_mpam: resctrl: Pick classes for use as mbm counters
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com, 
	baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com, 
	dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com, 
	fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com, 
	jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com, 
	reinette.chatre@intel.com, rohit.mathew@arm.com, scott@os.amperecomputing.com, 
	sdonthineni@nvidia.com, tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, 
	catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net, maz@kernel.org, 
	oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_074934_450118_FB31961E 
X-CRM114-Status: GOOD (  11.26  )
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

Hi Ben,

On Mon, Jan 12, 2026 at 6:02=E2=80=AFPM Ben Horgan <ben.horgan@arm.com> wro=
te:
>
> From: James Morse <james.morse@arm.com>
>
> resctrl has two types of counters, NUMA-local and global. MPAM has only
> bandwidth counters, but the position of the MSC may mean it counts
> NUMA-local, or global traffic.
>
> But the topology information is not available.
>
> Apply a heuristic: the L2 or L3 supports bandwidth monitors, these are
> probably NUMA-local. If the memory controller supports bandwidth monitors=
,
> they are probably global.

Are remote memory accesses not cached? How do we know an MBWU monitor
residing on a cache won't count remote traffic?

Thanks,
-Peter

