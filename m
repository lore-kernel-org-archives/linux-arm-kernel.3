Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A02CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=; b=I1xsc1j4E87yJbHePHD5o6FduK
	PrYFyRtLTq1H+MQLIH+55+VW5dC82zRNfzyjvsDrMIvHjrAObCf1VTBhObgaPubr/4CwwU+8SeaWA
	IK4QepIlEl13mUAbzoTujZTxE3RCQwvMCs//XbB7iKWfUh9PMZtaRN6rZbA82fWImQ6DbwPMwPDn8
	I+p7MJeT5qVI2pOE/QhlRIe5iNMAyWWpf/ptOPbs9yc+ogYEz6OcQ4WDWYho7UjGnUTa+PhRXr3/J
	aOlL3cEjSIjTMfJ1IX07f5tuY8QPHTRDhBcD2PVocMBziSPdOG12gZXrJvcAzxrhAuDFGIi7k2cm2
	07AX2mvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvYW-0000000F6fB-0qhO;
	Wed, 14 Oct 2026 09:45:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvYB-0000000F6a7-2w3W
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 09:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=; b=CDKb+vy8emM5/Kr6Zjzt5e/YcJ
	DAzxvls/yLRSbMhk+umWdcal9QXMoabLCBXjiJ7C1olb9VQcFbz/1BWjwb6YbfMvqWgjlAD6kR7wq
	xUcz2PRl1ssEZJhb4VlZZ1vVdkBg69EYcP+NJNe6gecKKo34ldx43ODuUYwXfPAlY9gzLblZrOrAK
	sF+iSD9O8xu0CNjBM0vMhz1QBZn1wr4MNNSibOTI/T3QM+ecaF+Mvb22ZtDXcmqh64+keNHLRa5Wy
	YvNMpCJqzPIiQ/dLE4lgrtBt+adHDGGSK0EetP9D+2lvoCm4cUERdS7BjkIxTdR+g8UDtUaE9b4fU
	3IzaVc3A==;
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGvY8-0000000GabX-2z8s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:45:30 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-836c8bde2dcso25312937b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 02:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791971126; cv=none;
        d=google.com; s=arc-20260327;
        b=N3eQk5kFppSylh0htfH5wHB966SPCcWHNMj7wzbBZ5e0Y4e3kq66524vDbdWYag+qp
         QQ1N97UOttRYyudHUaItorLW2c1zmWSTnWsikPyX5JZvojzhtMbyZ1e43WVRGwYb6LOL
         y9lDULKFC+dXiFQZvatAI0aQ7jzNd6iYIMv97N3OnZf+936PbhHc77n/4xDJ54tUhS8m
         PmlnsWmDID4JDiM7KKZB4hMHnhDj9hJ5yuzrCOGeXQpnZzc8kxjiH+tHtYQSDDVEAgOC
         1G2lq26Qj+Ya4+x9zyOuoaY0fkveZHluc/KE7Omq6KSQCNkhHJksapZ7r6P7fOewZkqI
         ZLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=;
        fh=MHQfIs8+d/orTFujCOLwG6Gow1xsqcbgNNhM8Bfin9w=;
        b=Fn62vgQpzD1wVPWUoDSXeTpUkuqbNRHjkXJtighKJtj8/X/sXqvm1baQoQJXsgnR3V
         tDBncL+bNr35koG26u1rt+3vvRzstIsbXizaVwcaSl9Yn4tsE39tmFjdeBCBveYSOuk1
         b9xc5zoP66uCmIiG7l0UJ6fEZ6SPLixMta3eCLXcLiAiyjVsdDp61rL9mIZ8umQvypLu
         q9pHT7aQNzlYousxuu+Ni8Ul2766dlFCHrUW2I6b2HRkdXelOG8n1EhFDuKS6WhGqwdM
         HFmr2AlXlv+WheTejZe3gbHnrhFACs/XE/fIrnWWcujxriZMp4SZ3oVMU7QmTyDvXdAE
         QSSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791971126; x=1792575926; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=;
        b=fxRA/YorQp64MOPNQW0G3vFH5y5eIYAM7hXfKabLf2ygTQoq3CBt6ur9Ucxt8bEjSt
         LI1Z7vLegGVwX7AdiCHVncSTdQckuxAwaSninm3xXAjDMmD+jX4HOXIPtoznQW8vfUoG
         ugKK+inFyG66RTv/A9VhQ745nWZztovEeStQWMTn5xRn6brJVm419DmShCTfbSIp5YDe
         kt3SIfZCrAZ2E+XLtfULhxdf7dYnmpoJYUdZ7KUHUQKAkZQbVOj3SoztRt1pjwgaFa/D
         //aD4rihi5QMvI2O8h8Rb2YreibapmTKYnfzAsQRLerxQYa61kK0cAtimfN3Cm61BlEt
         38hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971126; x=1792575926;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=;
        b=VR17NFOrGRfw/CYjoRQhFiaY7uGZj3aFIOOF6MIoZ1q4n/lqCdyE87rFnVa7JZ6WQr
         rfi34c23erbrRMA9M/hNnU6Xb2W55VMFeMbbpwIOYcmN52iPX07xZMV3dyFb81QlnOYX
         vSE02Gtt44T7VVte628e/gBCJpI1sbNr+y8iHVZPIZmVhWw4zXNZbmksill7iQZ/VsHu
         QuO5fUuMXLUdKoMoE1xg+tHb5k65HqAqUvGRSkT05ZZk+hBTsxtx+sv5X8+5xKYGH2Cr
         EtrYWTMzjaqEmlPZgrJMRqNbGDaQQq1McZ1T1hMe3acamlA+KIEgn1okfWJ1ApLkFPW7
         XZNg==
X-Forwarded-Encrypted: i=1; AKwUvBzIWZYWa6znvYYVH08Q64LJYFxnMYkzmBX/luz9dnF46B92KfuwzkfAU4i0Vbtsz6EPd527itl6eSUcfRAWVzAh@lists.infradead.org
X-Gm-Message-State: AFq9FYJR+AmfbUKt4fKluahttcyn9STfomYhatYQJ/9SIOpR/zXhQB0f
	v+oM8miI5ayQWXf+5o79moK5cMnmNumO5901N3GICzXDgYA2+1x4yjJYifmzF2ceLYNqId4V4cf
	5QDAXwk2e5XL1/FEKhK9WxtXA8ZGez6O2px/8a/oB
X-Gm-Gg: AYBFou0OAguY+Ae/IdPYCN+xOyHPSrY3jlFEfsVOeN+syPUxPvhU9V7e+2AcKJY3RNs
	dFCW4MneETF+CXiZQXFQ3/QcEcGUobUZp4j+W1tzBJGXK8RDgXIil8DoAPLkxGJhthiuDRTf/F7
	LrsFkRNZK5qIWE6Krt6nqJYUyhJtil7HTTYdlOKeTALqY89vxQFwzEC/uEJRP5m3MVhXGGohvFN
	MxBvel/RDt3m3nBjTzrcJQKGRahfbDuLhVUrMr7GESh+H9PAukElRPsg9MuY/abA48Cc80H6PoE
	XiriPCVsFA63krdYSLc49ZgKApMOhV6q0n5vvrTPSNttB+qzPLjGMp78kJJ6tXQtZ1wsI3OsG5x
	CwB/5Sw5O8Pe9p0fC2e/NYkhHrbSUTUty7SK0IROC9OQXKv3i4YRFqeAe1hND9F7XbkY0QI75xh
	TWCK5sr3mHMzVvaFQZ7oc6xophc139FiFONWFNSW6xRceazz/2zsA4WtpGbfIxndYuwdmyO/wIL
	GoiOFXzARi/RFrBd++ZZuHTpq9a8rFPYFufKr8VjKtvolpf/QG9wI2MptsZuC198ivCk4sgn9hQ
	VOTyAAyrLeE91g==
X-Received: by 2002:a05:690c:c4e5:b0:8b0:9e22:2651 with SMTP id
 00721157ae682-8b09e22273cmr36219317b3.7.1791971126209; Wed, 14 Oct 2026
 02:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20261004171636.3545085-1-julius@bairaktaris.de>
 <20261004171636.3545085-2-julius@bairaktaris.de> <b4aa46a5-dd8a-4520-8574-d008a3877f28@nvidia.com>
In-Reply-To: <b4aa46a5-dd8a-4520-8574-d008a3877f28@nvidia.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Wed, 14 Oct 2026 09:44:49 +0000
X-Gm-Features: AclHuK_at13xJpgBNhwlZvLzlUVxJXDvkN0LGkLWSuS73Rn7U8oFN9DIXlg-t_w
Message-ID: <CAC1t37K0tEMzxmRhLeHnH-TPx61pZmCHt0xxTJ5Wq2Wxvzv8Jw@mail.gmail.com>
Subject: Re: [PATCH nf-next v3 1/3] net/mlx5e: Ignore FLOW_ACTION_PRIORITY on
 flowtable offload
To: Jianbo Liu <jianbol@nvidia.com>
Cc: pablo@netfilter.org, fw@strlen.de, phil@nwl.cc, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	netdev@vger.kernel.org, lorenzo@kernel.org, nbd@nbd.name, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	rdunlap@infradead.org, skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, saeedm@nvidia.com, leon@kernel.org, 
	tariqt@nvidia.com, mbloch@nvidia.com, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_104529_095310_A7A09D04 
X-CRM114-Status: GOOD (  17.58  )
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

On Wed, Oct 14, 2026 at 03:17:00AM +0200, Jianbo Liu wrote:
> The handler is only in tc_acts_fdb[] and only accepts flowtable flows,
> so NIC mode and tc flower rules are rejected as before. Looks good.
>
> The comment says what the code does, but the consequence is worth a line
> in the commit message. Because the action is ignored, the priority only
> reaches packets still on the software fast path, where
> nf_flow_offload_forward() sets skb->priority. Once the flow is offloaded
> to the FDB, mlx5 forwards it without touching skb->priority, so the
> offloaded packets do not carry it. Refusing the flow to honor the
> priority would keep it in software, so ignoring the action and keeping
> the offload is the better tradeoff, it is just not obvious from the code.
>
> I checked this on ConnectX-7: with the series the priority-carrying
> flows stay offloaded to the FDB like plain flows, and without patch 1/3
> they fallback to software.
>
> Nit: "prio" already means flow table priority in mlx5; skbedit_prio
> would be clearer. Not a blocker.
>
> Reviewed-by: Jianbo Liu <jianbol@nvidia.com>

Hi Jianbo,

Thanks a lot for the review and for testing this on ConnectX-7!

I will send v4 with your suggestions this weekend.

Best,
Julius

