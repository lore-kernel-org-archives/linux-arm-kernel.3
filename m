Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D647ACA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 16:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sua+Wy3SP7kAmiXFJighCnAtG/CYHXm1C30k1V9F5IU=; b=TWjMUGBw2RLHYB0Mng8wU4pEi/
	kqeO+5+D1790ioyF8VMCkqN5MA+Zwy148gGeif9yN/f8fWI3DBfUhO7ybX6SL90EKYw9PWe/Fu2ye
	uIVz2ignru35NuVtBIP4A6W3YwtlXI4XcIgHlB1LU3cTVGDE5qLpuf7QV8Z7fCUik0Pvai81KrIEG
	7idc+qf599aI0AmbO4B9lBdaxNVL7NaFaWisjkW1H0HuEG0dy04iCBFjz+6gsJRpksyy912fPdSxj
	j0HrdSSvvNJpcJDTTfQ3FHspFCGgPRGGfC5o+sKzf5fl3TWwLIQpO3fRRm3uaqK1FtG291pjFuMF1
	rmzcW3GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTcm-00000000tH9-2m0O;
	Tue, 02 Sep 2025 16:12:48 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ3c-0000000HCna-14TG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 12:24:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1756815838; x=1757420638; i=markus.elfring@web.de;
	bh=Sua+Wy3SP7kAmiXFJighCnAtG/CYHXm1C30k1V9F5IU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XG/9C8vD5dCbG/24CuybjYnCt2boqaSep2tSNL7czIHZLx0I1umsXGJqErv8r3zB
	 /cI9eElvV9qb37S6yOjgVnxWmupmrTfZkGJ+Qui0DRhhiYO0sukcgFRDhfk3aSPnG
	 ZP89RP3QjiJLItXWMNHEvcaH7ZpU7NR73EaVTqaRxC1IH99ipwch99CnCl46Wgves
	 XgBdgR93+WRXw+mFShpphFfK5chLieHMXRuquw82Arbq7qhay/dMUA+P75vBOvs6G
	 TRqndVuYI0UnL7o3vEc3o0JeybQHewkC1YjbVn0iug4bUFmjJfISYv810q2Y5XDks
	 Qzh8D8i+tNH0X32zAA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.184]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MdO9E-1uK5Ec1sB6-00dX1r; Tue, 02
 Sep 2025 14:23:58 +0200
Message-ID: <bad20725-5b0d-4c60-9ccf-ef4fbaf112eb@web.de>
Date: Tue, 2 Sep 2025 14:23:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Miaoqian Lin <linmq006@gmail.com>, linux-acpi@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?=
 <jroedel@suse.de>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Shameer Kolothum <shameerkolothum@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>
References: <20250828112243.61460-1-linmq006@gmail.com>
Subject: Re: [PATCH] ACPI/IORT: Fix memory leak in iort_rmr_alloc_sids()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250828112243.61460-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TU6Q6FqwZr/t71ONHgz9hFpcbuhilBZ/4QzUZ4p73jeIkVOhUKj
 pO+AytZ5q28fBJK3L5uD2/oTXhPJg0w2JHPokYY7ski/0yvpY5X5xxS8pBnYeJfaPuLDHl9
 D0ELd5SQFISLRPnQDwIKt0akq5rVDhA+ja/EFFZKkSod+C21xHMICQ2KPFtQadCenWbRwap
 jeO1nFgc8lkGzbio+nQ4w==
UI-OutboundReport: notjunk:1;M01:P0:FSnlaNfDKvM=;5uu+LsKHb4IWws/zOdfoIwffpSl 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 nW25+LD5CAKAY34ZPdx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_052416_581569_DD48EE59 
X-CRM114-Status: UNSURE (   6.04  )
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

> If krealloc_array() fails in iort_rmr_alloc_sids(), the function returns
> NULL but does not free the original 'sids' allocation. =E2=80=A6

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.17-rc4#n94


=E2=80=A6
> ---
> This follows the same pattern as the fix in commit 06615967d488
> ("bpf, verifier: Fix memory leak in array reallocation for stack state")=
.
=E2=80=A6

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
?h=3Dv6.17-rc4&id=3D42378a9ca55347102bbf86708776061d8fe3ece2

Regards,
Markus

