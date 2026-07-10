Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F92C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 18:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zp3AkSb7kz6GKD3cr/eSusRHkHnQftat49AwvvVk17c=; b=0JLjirW3bphpp2ViVmGd77gEHp
	dGpvxIRkQxsH9aPs/y1sT9RrjbaTFVzI7w4Smd9yG2pcJxJAarEKlGU4FrczAMHi3BKMQt9MgzXdR
	OgO4nOFWRbFZ1AgVq6f3L0Fv+VKApoSCRp4dG05FJujcvFgwhqK/IBqy7E7sNy1dHtk0CmM6kg9UI
	+bB3jMxXaxKxeJC9j1LXcYow1yYU52o3FJrgMGq+nKOYebPVS7qpKYy/HEQC/CtezO4n03sTG/WmT
	5PNKyQH4D+FpZ4TiKQrEsQMARDpE/Hw8r9+7zGIXWwFeIfKqppSdQMcVJk99OJxLDO7rxIvouAVNO
	IXSgv8ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiFrR-00000005UqU-3Ex6;
	Fri, 10 Jul 2026 18:22:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiFrQ-00000005Uq2-15cj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 18:22:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3feY1443737
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 18:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zp3AkSb7kz6GKD3cr/eSusRHkHnQftat49AwvvVk17c=; b=Jt9Car9ArCHFFtvH
	+qZq2mY2PacEFBIKMPX5bjlqvFazBPjBEJVijdnnw+joPCLvckjVg0Cqghel9MH5
	mvdjwHTbWV641nYGrkptZT50oU/tuOQa6xNJsD2e0IQXFFATD1h7+9HUgGEchgKv
	9Idg+7LgHqyl/t2TiOZ39/So/ROZj0Bw8bXZY7+ibpwduQSL3dKfXh88zbH8y0Ut
	hLwoF2MN3UvKr4btzt7b19NmEb00vVPHgdk6KLlgp1G3BHKAzcr+5GzSsGS03eQ/
	IQBTnQnQ1pkC0hjHyJGrwTEE8XE//dV4c17JYcZM40Z1uvZbNehTc69QcOwQJjW/
	ENSTgA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwebu9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 18:22:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so1909121a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 11:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783707723; x=1784312523; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Zp3AkSb7kz6GKD3cr/eSusRHkHnQftat49AwvvVk17c=;
        b=XV50/XSrlp3Z9KWZ1V0pMv8WkmQ3l7Chso/wNQjI08RoYkrK4LdZ9y5K6SZHz0y4y5
         murXZtvSO+c7KJhyAUkC2QoZNwby5Ywzi7YwxWSC+g+JLz0+dDg8Jivl3IYyxlk0mCbw
         bBhbXOarSA5wkr4z+65KSEObSVdyQCrx0wDh33xOk9E5HfLpl4eqqi0d3Zb9J8laGVKC
         HYSTKB9HUNe444k+7jmhZx0Bohw4S+kFH/FgiQh3vKSEGGplh9NhxNutrAnN7gXnqHeu
         TWd9WYPG688MHYfsxmCvh8uKrozhh3bZJusAVhIrwiRSQj3xFneAEDEkCjSr0WUeAYGJ
         AY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783707723; x=1784312523;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zp3AkSb7kz6GKD3cr/eSusRHkHnQftat49AwvvVk17c=;
        b=ASUV/5W/dclGZdHKsC2CDL4vMYw6vX4GuFtfxrk3jPVNPaacLWscHF4M44RArwlRdV
         W00GhlfeLFkOo7sCgDKokAfganBYzpEh7hx47lCMNAp9Imif+Psw7Pt2Ps1lC8MzphnI
         nGu8JEiRW5dthltmFUwv3AAD05OE1gNz2usqatS9Etj/S/w67kyIXILO+IwjVKQuJZJ8
         6gsJIPhGcHLcvsZnLumRQtOyJVa0vbX6ay4qUdUJ5sPSmMgjqlv1qbZ3EYW/bRIhcCbY
         04fGNbrU3fUPCVhzO+H4uvquACTqM9pEqDg1UT7vzL+reGepN60Un70kA6C9B9/tOD7S
         BAug==
X-Forwarded-Encrypted: i=1; AHgh+RrCIgNmV0ipVSdEQqxqGGwpEdiBgJiZZViIyyz/OTwB7475EOOK68Ay81wgPkKFcbOg3e0f9SJjY7JdmqOz3Z0H@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzm8GAbzX1dj+MOe2cFWmCEtvUK6FPENk6qTBHd/WbxT7hW3ab
	w5nzb0IK8AH+9Pg2dXI2tzBKTZKaYprrKmbINy+8llfCBxtXmuBD8j2yfaStNNNvkWlllg5+mWL
	N7Ay2wzwT+yi2UTq5FYvs7REsYYep1D8zhrZMDej21GUZCxHg9JuP3jWRkd7mG7PMNUfEVebVa2
	hm2g==
X-Gm-Gg: AfdE7cm2dDav+4WHs/3ppnn86RbmjikyCrsXYTd0OBofPhPnVijmCgnYI86KIvFuEL3
	5bZwQHlG4Ocut3t0URKm1xBxa+Ihcre/UfVk7MlVTyDcCWoN296Xo8XNU87NB6R2Ce7GFfFKyc6
	Glt1IECvNqo1xXf+HtMnnPQiAk6cSsQKQ+4ewnRonHCsahCd7glPz7PY/1xbRcPs+6s31fTGEcz
	Gj/CIXB1Wb0D6iSLXKoTIUH5EpHqwGbyg9Nys6SPGU6/3XGvvNDjxd8+GcIqJgYiSyw5g+8auZt
	sf/h5VofPRNE9T7tzkyhkXE+PXMQrXQA647mr7Zvz7/lq8EufKrWrBwJuTBdYso8F7x08y6hbtV
	c/jbNRwu3cZAJ0wsTyqfV0IUk5Ev6iYKpYqGE
X-Received: by 2002:a17:90b:4c8f:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-38dc75d1ef9mr95655a91.2.1783707723048;
        Fri, 10 Jul 2026 11:22:03 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8f:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-38dc75d1ef9mr95627a91.2.1783707722569;
        Fri, 10 Jul 2026 11:22:02 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483dec6sm44025766eec.11.2026.07.10.11.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 11:22:02 -0700 (PDT)
Date: Fri, 10 Jul 2026 11:21:58 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre
 <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan
 Cameron <jic23@kernel.org>,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait
 <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/16] arm_mpam: propagate MSC read errors for
 wrapper functions
Message-ID: <20260710112158.0000490d@oss.qualcomm.com>
In-Reply-To: <20260710144520.917375-3-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
	<20260710144520.917375-3-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a51384b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=499MpapIjUE8vGAJtSoA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE4NCBTYWx0ZWRfX5P9MmxAobbz8
 aHIAz6M6tvFYXQ8uIFuJiZf/yeNmZLxYHeJrxdRgKTF6nLoRp4JgfnQlf2sRdYV8mJ0iX4wDdIv
 pynatoGpxzPb2+TrfNcEhu4sNFoO6QweruGNDvQLd0ATeaO9p7OhoM6+eMAJmc8g7nGWo3olUlx
 hzolxqJS75BU2BGgIdiygCwrL+RkTsYhC1DKDp3qfB9Mx6td9/J4Ifw13q4euS7PcYqyK74kD0i
 NieJpb5ULrSLWFU+5UctGkfXJUOFHfV3Opoeur/GqMifSBZNQSftq8kWVSa1DcFecn1Go0Oz9XU
 H1iVvDWdL9IBruf2E99QnD+I6SnxyzrDHmH1zsyftgN2QUW1+bqhmQvVJ70v8hSuIm2KYeHRoXf
 fKJHXQ1Qt1vuFipUINwrJD2UOoAFQss98yozwGyFiwJiRmbkEMxCZPkcyamTkZrjpzMyE8hjHwv
 wQ3IiyRxg95xrdfTQMQ==
X-Proofpoint-ORIG-GUID: dPTkpw5VkNRd2foenvaCXn98Fu-6_qrk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE4NCBTYWx0ZWRfX7ZJqZf2YzomA
 SIG1csn8e/jh15RqrLzcNEVJLioBsPlW8yZ0bQTw4QjRwZnJcG2foBizD8Gzxr7QC9mkkWIUJpv
 A633e1+JCdUdbqmR4YRucf0GbWtGmw0=
X-Proofpoint-GUID: dPTkpw5VkNRd2foenvaCXn98Fu-6_qrk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_112204_339033_F8DF8CE9 
X-CRM114-Status: GOOD (  27.16  )
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

On Fri, 10 Jul 2026 16:45:06 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> Allow the wrapper functions for IDR and ESR accesses to return an
> error, and propagate read errors from the lower level up.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Hi Andre,

Just a few superficial code style comments.

Thanks,

Jonathan

> ---
>  drivers/resctrl/mpam_devices.c | 53 ++++++++++++++++++++++++----------
>  1 file changed, 38 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_device=
s.c
> index df14b4513382..8fd2c38c821c 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -247,27 +247,38 @@ static bool mpam_msc_check_aidr(struct mpam_msc *ms=
c)
>  	return true;
>  }
> =20
> -static u64 mpam_msc_read_idr(struct mpam_msc *msc)
> +static int mpam_msc_read_idr(struct mpam_msc *msc, u64 *res)
>  {
>  	u32 idr_high =3D 0, idr_low;
> +	int ret;
> =20
>  	lockdep_assert_held(&msc->part_sel_lock);
> =20
> -	mpam_read_partsel_reg(msc, IDR, &idr_low);
> +	ret =3D mpam_read_partsel_reg(msc, IDR, &idr_low);
> +	if (ret)
> +		return ret;
> +
>  	if (FIELD_GET(MPAMF_IDR_EXT, idr_low))
> -		mpam_read_partsel_reg(msc, IDR + 4, &idr_high);
> +		ret =3D mpam_read_partsel_reg(msc, IDR + 4, &idr_high);
> +	if (ret)
> +		return ret;

=46rom a readability point of view, I'd indent the if (ret) as well
given that will then make it visually clear the check only applies
when the if is taken.

	if (FIELD_GET()) {
		ret =3D mpam_read_partsel_reg(msc, IDR + 4 &idr_high);
		if (ret)
			return ret;
	}

> +
> +	*res =3D ((u64)idr_high << 32) | idr_low;
> =20
> -	return ((u64)idr_high << 32) | idr_low;
> +	return 0;
>  }
> =20
> -static void mpam_msc_clear_esr(struct mpam_msc *msc)
> +static int mpam_msc_clear_esr(struct mpam_msc *msc)
>  {
>  	u32 esr_low;
> +	int ret;
> =20
> -	__mpam_read_reg(msc, MPAMF_ESR, &esr_low);
> +	ret =3D __mpam_read_reg(msc, MPAMF_ESR, &esr_low);
> +	if (ret)
> +		return ret;
> =20
>  	if (!esr_low)
> -		return;
> +		return 0;
> =20
>  	/*
>  	 * Clearing the high/low bits of MPAMF_ESR can not be atomic.
> @@ -277,18 +288,30 @@ static void mpam_msc_clear_esr(struct mpam_msc *msc)
>  	 */
>  	if (msc->has_extd_esr)
>  		__mpam_write_reg(msc, MPAMF_ESR + 4, 0);
> +

Might be valid, but to me that smells like an unrelated cleanup
that shouldn't really be in a patch doing more meaningful work.  Perhaps
makes sense when you circle back to do writes.  BTW, I'm not sure
there is real benefit in separate patches doing reads from those doing writ=
es!
Mind you I haven't read all the way through yet, so maybe I'm missing some
subtlety.

>  	__mpam_write_reg(msc, MPAMF_ESR, 0);
> +
> +	return 0;
>  }
> =20
> -static u64 mpam_msc_read_esr(struct mpam_msc *msc)
> +static int mpam_msc_read_esr(struct mpam_msc *msc, u64 *res)
>  {
>  	u32 esr_high =3D 0, esr_low;
> +	int ret;
> =20
> -	__mpam_read_reg(msc, MPAMF_ESR, &esr_low);
> -	if (msc->has_extd_esr)
> -		__mpam_read_reg(msc, MPAMF_ESR + 4, &esr_high);
> +	ret =3D __mpam_read_reg(msc, MPAMF_ESR, &esr_low);
> +	if (ret)
> +		return ret;
> +
> +	if (msc->has_extd_esr) {
> +		ret =3D __mpam_read_reg(msc, MPAMF_ESR + 4, &esr_high);
> +		if (ret)
> +			return ret;

So this is the style I suggest above. Good, but check for consistency.
It may feel like a really small thing (and it is :) but keeping code
very consistent helps a surprising amount when it comes to readability.

> +	}
> +
> +	*res =3D ((u64)esr_high << 32) | esr_low;
> =20
> -	return ((u64)esr_high << 32) | esr_low;
> +	return 0;
>  }


