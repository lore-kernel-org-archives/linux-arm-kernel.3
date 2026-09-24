Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CC9C98311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QknsdGv7tMuii6XXd1cgWwDNDr2xK8Jt/GMeIq+snas=; b=4rK0J/w9WsF+FmBnnmZbJ8vSYH
	JW+Uswdt2NVcKpnyGdSjHxkPDDi53QQWtudHV/wD/NcIGaUrp5dvtsU+Jtm/+levh6KVy5EJk2Tm7
	eE+pHodVtgmofIeErt2HgHjfCKjShTOuLC94UXYbySHdqpsRSK9mXjQGTCjrcLxqGj8u5s2t+ZPkQ
	/Iym/XmmqB4Kjktb9+BFqGsl2ORKAf+XVI2DWrPv0qWZk+opMqUpbLXzKovPp8H0t8qDjoLlLfjl8
	+f7AJM13rxDJeQwmKh4LfjrT3IgYEsodKlHyWTD5o4i/Knxoun2aVG3PNR9lyRbmrvjv5Hf5IoYIm
	W0W/KnfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9f80-0000000AUII-2HhC;
	Thu, 24 Sep 2026 08:48:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9f7y-0000000AUH6-0BiP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:48:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eKdb1898759
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 08:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QknsdGv7tMuii6XXd1cgWwDNDr2xK8Jt/GMeIq+snas=; b=UN94VWfFCpWeeKgy
	OU62S9mvL7Zq/yMvALPyLzwyGxlf9AWoAZ4ggWl2keo+hEG8mUFHMJrFwJGYizXh
	Z1XpG7q39jMmxqybXtGM5xAEvAuSbkLJT9QPHNcfUiyUa7PdLzBTgV/3wO+6enDl
	aJdFfIFXddLX5conuM5JpXFzZieHf0UbvR6iK5II/WZu6O/gZgcQPaZvp4I4Tys7
	Dp/itSLyVeZOQCxblW/qFDjgZQrOE7LQSmP4OWMiDn2uUjkpEQWZv5fk2PL45WUw
	/9rbbA75soYkShhap0pXQ/Tm7Cbd6DNk6yJ/1BZS6R2sS4bEhJ5AdNhj18OCvQaw
	wGOn+g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb64qyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 08:48:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8632fdf67dfso717973b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 01:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790239704; cv=none;
        d=google.com; s=arc-20260327;
        b=DjwOyA/AAN3EZQQd55eRsBHHIo4ej1ZqOl8dvKyFq0X9YMNo5+AQONlvVgSPcJ2fzP
         wh/FR5nRv4CBDXFhB1m1DmjEHYJ0zEURwhIVlB8GMjhjt2EYOz4Wh7Xe5/bBUC3wmOjn
         cIwkjQ2BsVMKpB7v00dProxDgSUV8fiu9p93ifGXDzndoZXFbr0bBXbki+uYHKDbWvaT
         o4uMyKgsgQvMqK6LRb5vFNQS7H/1Mcf1SZ5bFD0d/7/2H4ZHbXMA4+aWY9iCYGXRBbp5
         r/ZyYGYs+hOteGzFdS3/+psm1soCXE6mFlX434MsPu8M8ZHb5Q8NC75iuVNJhOYhy1AF
         j2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QknsdGv7tMuii6XXd1cgWwDNDr2xK8Jt/GMeIq+snas=;
        fh=jpCsHXYJJvK7rHlLEo8i6/VXyifxmEssIyx3Hwzgrb0=;
        b=J57bvI9+BNR6/+006ND0TLye0f8hMkBicVataIB3UAEi71cpBO/ih98tdIy+P62Ytk
         HZY3fkrGAsED1x73SMzt8x0BxuDIxSForlYUZGgzRLWo2naQuSoGhkec+TlftdTHOh9q
         aePiGR0NH3NoI74isV8CMIsC+0TewpoSYlaclomg6RpZ0thY0qFs0ShNt4J46mHc8D9A
         3ZmwGXlzZbd3K9rvBZtYnjSDHnxiTWcDANfd6gVN463BV4gtrg/NALWHPiml13zXmVm7
         NxoIxQ8VS/NoVi7AkPqio/n8SjTvJEAqxqlLwfZbHymCxEJCjXK0rrUfTjeQ8uG5M8nz
         PdZQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790239704; x=1790844504; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QknsdGv7tMuii6XXd1cgWwDNDr2xK8Jt/GMeIq+snas=;
        b=HVLkREzjj2HiSj2066vJV+iCINvWUUb23jbqsOxJaaO1xFmbBKLDYAb+aCMyAoOl3v
         1Y/DIRPHKcZgNedb7YlUKlItk3b6SWN/GRBqS2+NsgXpDKxLZ6Y0TV80t3oP+psr6JbR
         UYoLaAvioKYvuXSPIMNeiiBD4f3roWOd+YXfyJ9ZlV0qX5ouylhLSFmBMl5GFH2K7ieS
         wiG07iYKcPxojzTYzMAAWplG9prFlVqNWxkIGD72XlQoJrZsvOyeMrw2az/OyZ2xM0OT
         pxP0QzKJqhxOPwFW9SWyacg9caejnkzYtcskpjjdhrpudd2VlRMUdVHFco8fnEjhFeLM
         zc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790239704; x=1790844504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QknsdGv7tMuii6XXd1cgWwDNDr2xK8Jt/GMeIq+snas=;
        b=BkNs+bVGlNVmMkzyRcSNDiDTiUVFIJsUb0ouSE5ql7nEcjs5N5jE4t79OVoOdWOvfI
         IE5KfE++Px35icOT+gsNf5Ntl3Nh7GZyoJPBPDPtmmJ/r53pc0NjRl6cGKLR6MRFBrFd
         nF05BDbrfEnYf/MOQGdrW6HjlnPWusCOe5oua3GphXwgz2Z1RQRkW6AIm5zcRGfDEiqu
         6zB6bFZl9Uyuj8DBDvjnCV1leNIzFdWRoJq4cQnBsrh4DFiwMx8lIkEt8eOOqFkUNyd7
         CsRhirs9p7wdJ61oWcVllq5wloKNqwlGiXBXiG0CJHop0SQjTbtcGgxDDIaqZVtYlUPL
         XiRg==
X-Forwarded-Encrypted: i=1; AKwUvBwTpI7sFPEHF0cubZ4HWBInZiUol47J0/4yRIphN2qxM8Q0eeVnZrPytERXFTUtaxG3CKZUfv0FAnzaaAe9L/b9@lists.infradead.org
X-Gm-Message-State: AFuF++mmwQX9gTivlVge8XE0spQmbuWVEDBPSKYsJXWJusWpLakcdKUa
	xiIcQOoGlWMzHVXkaPVJewKH9pD+WenEC3aCKoTkiCp7+IkCWkxhHhd2K2lfKCQ5KcgK3A9DKa5
	1zB2C5kHThbDNPCtS7MgRPT3jxwlS+3jPfzIXnx275j8Jk+IxqAj3zwDzBux27L6iKqszayuSUb
	MfqWcTnVrWCczP3B73PUy688w5FP8B3qtC4ZTpu5xz9QhhBphLlFKi
X-Gm-Gg: AYBFou156bYbkO1OZPwFu1aRLxT7ty+h2a7xmu+wbYNGqIynEQKcATwR+3Xc/YflCDH
	7HJwzob9Tf1n8J15TTCJDisSqmEuJXSuicZSfhmgX+M71W3pqs7wvGme0qT6udSnPGmAzj8OYhu
	Vtc9yStHRt5lG4hzQqdjAz4PbpctdU/2Vb9QbIvoHN+FZfZoqibVKIHeBKrA==
X-Received: by 2002:a05:6a00:3e16:b0:874:72b6:7daa with SMTP id d2e1a72fcca58-87ea07d0ad5mr1069233b3a.37.1790239703770;
        Thu, 24 Sep 2026 01:48:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e16:b0:874:72b6:7daa with SMTP id
 d2e1a72fcca58-87ea07d0ad5mr1069219b3a.37.1790239703328; Thu, 24 Sep 2026
 01:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260920175928.42566-1-s.shtylyov@auroraos.dev>
 <CAPx+jO-Ph038WJQ4gMH93XzoMC09+meht=yT9JQBAnTD6HzGEg@mail.gmail.com> <d07cb609-ca44-46aa-bd56-2554846399f6@auroraos.dev>
In-Reply-To: <d07cb609-ca44-46aa-bd56-2554846399f6@auroraos.dev>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 10:48:11 +0200
X-Gm-Features: AclHuK8KtFrkT0Zvnhed46Hh0nuKWmXhRe39UhgcDjpnRieTa9rTOGP9GA8usM8
Message-ID: <CAPx+jO-c_w55jO9i_Db459Ya+9yV3nT3akQcaPxr0qb7TqSejQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: rockchip: fix domain check in rockchip_pm_add_one_domain()
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Cc: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Caesar Wang <wxt@rock-chips.com>, Kevin Hilman <khilman@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: PETudIFiK8bcBT56FzAow9zDTG3BZAhd
X-Proofpoint-ORIG-GUID: PETudIFiK8bcBT56FzAow9zDTG3BZAhd
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab4e3d8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=HH5vDtPzAAAA:8 a=kRmKsBWSVBFGW6OGaTAA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=QM_-zKB-Ew0MsOlNKMB5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNiBTYWx0ZWRfX2YFEcYXwJmOB
 aWm8S/bJS40og7jHqhySvf7awEDUNWM7eBqaSZYU5k3WWEJhbImjAqSkU7bpIpZzsM2ERyNemZU
 ct6TVwF4rGqToWhVEn5OJhqAlsPyZVc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNiBTYWx0ZWRfXwbktXsQAtNMA
 uU5cqK4XP8dKupSdHHbGPqkD83JCczQdaM1QlKuiYwv7W6xj1sBV7TeHAH4P8oEgug7geTGh/Rc
 CrmrJzoBPm6cuoeTHj1jneot4wx2EQnmNq6b4mjMk+in1UP53u+f5bQ+RISBrx+gc/DW9UN7e3O
 FXJRklzlmlcRZjsSb/4lGPr32m7sY038IWyYzp9VTeKZKdv1LtbGZEsDDdOq/Qy9YtF6CZL9Qbx
 hjgVvZk6EC3nNR2Qy1koqlJTHpbNu+T5ijjzyPyifeBoanqRrub6DDmbUg4rRnm84bhdI+OtcqP
 xLQzK+Xflj7bTV8WprYxSEAIUkqrOzlrxDcXCbKXLSq94n6iXfY47BtlUef9wOlNZlP9Xkfldjo
 33IO9AUSXlC3ErGiXc9lEkONj23fgDKhBkZKmNKbYzNvgjT8oWdGTtG67raV1MPDiDk5S67NL3y
 r6qGQeaqzlbwayURlfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_014826_193845_4FA71DB1 
X-CRM114-Status: GOOD (  27.74  )
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

On Wed, Sep 23, 2026 at 10:38=E2=80=AFPM Sergey Shtylyov
<s.shtylyov@auroraos.dev> wrote:
>
> On 9/23/26 3:14 PM, Ulf Hansson wrote:
>
> [...]
>
> >> In rockchip_pm_add_one_domain(), there's the check (most probably for
> >> the case where the "reg" prop has an unexpected value?) which doesn't
> >> make much sense as the variable pd_info will be NULL iff pmu->info->
> >> domain_info is NULL and the variable id is 0.  What does make sense
> >> there is checking pd_info->pwr_mask and pd_info->req_mask which (as
> >> seems to follow from the code) can't both be 0 for a valid domain...
> >>
> >> Found by Linux Verification Center (linuxtesting.org) with the Svace
> >> static analysis tool.
> >>
> >> Fixes: 7c696693a4f5 ("soc: rockchip: power-domain: Add power domain dr=
iver")
> >> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
> >
> > Applied for next, but without the fixes tag, thanks!
> >
> > Note, that I am dropping the fixes tag because if there was a real
> > problem, we would require yet another fix on top to get the
> > corresponding domain declaration to be correct. Yet, the patch is
> > useful as is!
>
>    I'm not sure I understand you. The patch should hopefully be
> enough to detect the undefined entries (implicitly init'ed with
> all 0s). What fix for the domain definitions do you have in mind,
> turning the arrays into lookup tables by adding a domain ID as a
> field to *struct* rockchip_domain_info?

Apologize if I was vague, but you kind of point out what I just said.

The patch helps us to *detect* incorrect entries. If it turns out we
find one, we need to fix that entry.

Kind regards
Uffe

