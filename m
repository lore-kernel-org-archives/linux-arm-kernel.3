Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45917C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSUX4rmxFz9Z2gBtnlzHh970/YgCNq6kC/HDrBYmw8M=; b=h2hUdi47NBK1HIYH/xfMS7jC5h
	iH6uYe+EYSQpQH/oKqSN/YXwRBx0jClU1VN8Rc6Tz31CMjVnJPPAO/Pz91LHCGlHwjRiRzR7LeISy
	hOxb4j/quv2iuEa457VAjGhhebajE2HyQv9KSyb7YkLmxbwEvNIb+h7AzVLk5epBTemgwebGM5XGE
	LUpNpe3PZvC7LThyMSArad96HO5i6biA9B5T6IvMi4DZHKs25Q0teD7i9HjXjA0aU8kBuFWcYIYdX
	iCs8nmO4Q9Dzy3NkdYcyf7H+elbC55flf3LPffy25KTjMFjDHu5nPuGw5OAttSY4gpO3RhkjyYzJ4
	jpWYihdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qLY-00000008Hc5-3cD5;
	Tue, 08 Sep 2026 07:34:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qLW-00000008HbQ-3BlO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 07:34:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LmCN1645953
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Sep 2026 07:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zSUX4rmxFz9Z2gBtnlzHh970
	/YgCNq6kC/HDrBYmw8M=; b=LFxI232UImGoY7CUSZ6Azl+dcEDUwQKxtpApVysh
	xqZy4LKcKVNXaYqFGA59tnRIT7hPrkgf7lpQZbb5zFGoaHeF9zaxBUuN2pf2/MGn
	G5Fu4F/dh+IULKrxawsg3O3/whmSgfK1CtICF8l5zwD/XIgRuR7wcOXDNpqT1J4Q
	3owJ5mEbD7QtB9fgifkg+uVR2Pc8Q779RMbZhAUZYY3biznfU2YswSe7f88Q8tGs
	gph3d7V0jWgdncXbNXmUTlQVLQ3dk88dy9Qb0cdmajRWbTPsQj7PD3r+wz1XfTGd
	00oy3PRKLyKztw5UEZ1LXSUBqyuFdbXE69hccD5bwThttQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvugb5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 07:34:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93917f4ccb4so511878585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 00:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788852861; x=1789457661; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zSUX4rmxFz9Z2gBtnlzHh970/YgCNq6kC/HDrBYmw8M=;
        b=iTR0yA7opIdviW7z0nGDvqySSZk3nheud45hjEbwNsOr16Uio0cHEzIXLjqnBZKtOY
         hv5nd/wlOSPRK/v3lV3Xz+FL0LCUfiP9vU5/5Dnimv/bUH5nA0iRSEg7M6+1801AWz7V
         XLv6zpAfCS8Wxp3Nj0fvPel4CW5le+En6LBhN/Zc2v2qZ43lxBn2fsRNOGB0aMWlWpYO
         YmlzqDpEC3GeHRGDNCV6eSVwFov+VoTwHMTL1MDs6NiAsaCa2KkgAIwMufOwX+pGl8ZL
         jNIay5ae9nSi/lImIGglnPtZUvZs+8ark/eBDyJkSeQn2uCwlBmAnl1Xf4PHoFnTx/sV
         mWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788852861; x=1789457661;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zSUX4rmxFz9Z2gBtnlzHh970/YgCNq6kC/HDrBYmw8M=;
        b=cM5M4AbZJdFl2MKppo3m+H08zjcgbSBPAVySW63c6RR0G9EAoak2w8XXBuEjqsHB2b
         ffuKUXfo13jFyNmcgGesjqQNkzfNpsMeQQs9eEuS+hr4eKNc3ooFmRIEsuJtYBGdmxGY
         3MUQx+7qVLNnUDqsX/lL5ycrwqxPavw293KjEKPlC58eKuf8HKK2g+Zx7XrS7384xDuh
         v9/7IbsGxZy2zAFxVCTKXpT58cKsHL69iaukCo5YgOa4OXlsY8Y0wXV0Sz8CzK9vYxYg
         SmVfFMLWi++XZ4UVj9ZOZ5vmWGghpeJwzE2fFN7SWkLtBcTI/xsAIxCx9XaCRgJPB149
         /cig==
X-Gm-Message-State: AFuF++l07nVeV0y1E9AUCDlWXABzmzm7BUEmLzDnEYteL0U7JgDnhMKe
	sQ1n/Jys0+6WLaxmvmDjbQHp7j1e08DImJzHvXx+AC2JBxQ5ZleUSaly+0NOXE2tZuei2goHMXl
	X9N0+T5oEhA/Sls/6i/RKLZ9gfY898sHke8wGqGT1jMyUgFGiHHnRrLx20+kIHzuVoFxXkFug7Q
	WwWA==
X-Gm-Gg: AYBFou3Pq4nY7NUoI16r2uHiaWCofM/ci/RoVchUGXJcJokv4cJALFcET/odTFjiap6
	d/ZSETLIRpWOLdqCPxO1PsOLYmEkWQrK5KgCOQWDg2hMoVNwRHlIQPpHZV0bLRz/Lvdkf5vyByM
	cg2BYVVFFoRojy4vkJ5s2Ab38rQgLzkcNhvdgVfhYZnRx7ZXMpy0RNaTV5HCb9c0TsS14oWh8g+
	7FDqLjk573qpCGShjePriVzO3Wa1IZEee4zvKjx6lvtpRXWaNnncFPlM5pJjOam0pnIckEVrf+t
	2EAw1g6HuC6ozp+JiyoyRXlHky0X1wf507As38GLHPzwx3DmlUKJR1kRfY148ZtOV4p5v75y+pR
	nJ62fFjvEqpI=
X-Received: by 2002:a05:620a:7087:b0:939:7f87:ff22 with SMTP id af79cd13be357-9398045fd75mr2956893785a.36.1788852861139;
        Tue, 08 Sep 2026 00:34:21 -0700 (PDT)
X-Received: by 2002:a05:620a:7087:b0:939:7f87:ff22 with SMTP id af79cd13be357-9398045fd75mr2956889485a.36.1788852860466;
        Tue, 08 Sep 2026 00:34:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm818612285e9.15.2026.09.08.00.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:34:19 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:34:18 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH] interconnect: qcom: icc-rpmh: Add opt-out parameter for
 QoS settings
Message-ID: <6iixty74opjqkegpdmtytffgrllcjvrmhlsv53xtackdqzvwge@6fh5onz27p6c>
References: <20260907171729.1735641-1-maz@kernel.org>
 <v2gxqazjoxe74q5364jucy4pjds6gx4gfdchgulekl5mwk2azk@we4ibolioibm>
 <87ld9c4vc2.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ld9c4vc2.wl-maz@kernel.org>
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6a9fba7e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=z6oAIkbW-EU95i1wH_gA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 98F5qhj2OKiT1cZXitBazuAD_vSW4xVK
X-Proofpoint-ORIG-GUID: 98F5qhj2OKiT1cZXitBazuAD_vSW4xVK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NiBTYWx0ZWRfX0YhxZWnJOR6F
 IxuE8HaaaBVRiFWuLZWJ9XFHJ1tEyACL6WrNmd+YXYj1hQEDbQjcZYNQV95mt7rahWyajzf0Tys
 QTn3EbCNX1TDPrE5bwnPECZNmqo72CuOD7v8WdjvmD17OEDIz7UaB0PXYPP/9c7TG+pL0ZLjTOu
 lAupMCSxqvNhMxWuxir/+Ee4U7bFWs7HfE9e3awCp4KV+rXN5/ZrPgWQa6uiZzBs2fMmlCDbyjz
 53mSV1qPKG+DpnJT/gECBmTo0qbv1Y2ZPckqWxAyyfsT9Scb+9lFvSUkyLO2wAgHWUfmWC510oy
 8ONmE1ncktr0RzyDqvvM3kjoZbbCN5YE2uKxO2G3SkBRu78htgWb7aYNh9bv4idtBE87EaIyGO9
 2Mqm6QDftna7k1qBIthuX5nqDj5KHhBh1uQp3ZMe51oK1cEN80MJSX3UrS11imI2yrKdw3SNAgn
 NpG3eXUG36XaFoGIp3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NiBTYWx0ZWRfX4MvbxI/rD46y
 s16eBxW5JMMJ7/lkP6vKqHpnL88SPhaiwG1R7rGrMy3W6A1nyng2jlfvRuT2X/y+EmCGcl1uDRf
 Lju5qHgeOmF0/6rDxBhGXB6q6Vep/ww=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_003422_802772_8301EB5A 
X-CRM114-Status: GOOD (  24.62  )
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

On 26-09-07 22:15:09, Marc Zyngier wrote:
> On Mon, 07 Sep 2026 21:21:44 +0100,
> Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> > 
> > On 26-09-07 18:17:29, Marc Zyngier wrote:
> > > Recent addition of QoS configuration to the X1 variants resulted in
> > > systems that spontaneously reset at boot time or under load.
> > > 
> > > Given that this is both very unpleasant and hard to debug, give the
> > > affected user the option to survive such event with a module parameter.
> > > 
> > > Passing "icc_rpmh.enable_qos=0" to the kernel command-line will skip the
> > > offending QoS setup.
> > > 
> > 
> > Lets not start doing this, please.
> > 
> > Can we figure out which platform deosn't work and then maybe we can 
> > add a quirk in DT per platform?
> 
> We have at least 3 machines that are dysfunctional since [1] was
> merged (mini-x, sp12 and devkit). Probably some more, but I'm not
> going to be the one doing a survey.
> 
> What really should happen is [1] to be reversed until QC figures out a
> set of parameters that actually works, instead of making this platform
> even more unreliable than it already is.

I'd rather have the patch reverted than adding a module parameter which
users might not know about and distros will probably never addopt.

> 
> Just like [2] should have been reverted.
> 
> Until then, we'll have to paper over this stuff.

But a module parameter complicates things rather than just papering over.

I suggest we get both reverted if they break existing platforms.

