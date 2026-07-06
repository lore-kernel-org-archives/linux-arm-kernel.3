Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3E4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WxWaaRb93QDxqs8eJfGcKt+ODegJrM9FAhD1rn4dPwQ=; b=YvhIeUmFT5wp92GDsbszuSGnTW
	OTyGKw983G+9GleFBdFCj2qvnz0MyuTkVhw0ngh2PzNVeVlX39E3o/DGrxXyg5Tn3ZD0Nvvz4ggMe
	qTILg2FenNi3QFTGAqgXr+QV1R3froCPXbecNnKjd6ftxMMzgAWAFfNQAgd4u/1hGqPiNNDAvzYFE
	sABtSuDru0K2lwqNDIVDRKEmPU33j1Ol2i0sgdc8DL3BfzT4/S2zS9YQPHxNCxZxioB0Fwc3jTB4j
	sE0YuY2cIAMENn3XGpXbJdn3GhoN88kkC8wgCBqrpHNPgr3G+G0Q6NacEeaWcvMnoiiGTzBW82csN
	H4AychbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglXm-0000000CwWF-3Kgu;
	Mon, 06 Jul 2026 15:47:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglXj-0000000CwV3-47AH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:47:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF21c956766
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 15:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WxWaaRb93QDxqs8eJfGcKt+ODegJrM9FAhD1rn4dPwQ=; b=JCGdUd7433iyy6of
	C2ieIfbLAFPJj/a1Av//CnFq26oYmJ3u3dTULDOCRCcW1uV4qG2Pu6x7bm5t2d5B
	O+dpelG6Mc+qLkskLQYLSa5a1OuiO1tjDBe3Ebie+2Q93tvXWR1j7F44RIW0R3Vz
	pSuvZhWR8PcjBFabUYYBDkjrygbYzieHO3uMgZvyn8iXJ+YU/me+lPZ24MX+rt3P
	dO/ywJPL2oDJNpYEKlxNlDZG2rQk+6ntgcFNYgdk3AF/xRahfGXP5/BzrWq8MtEw
	LRun+0/hWL6co5Ya51FTY7qLbihQx3hJAGIUflBMNgBYmAQFhqAdGgsEWah8Pmnq
	3EHF0A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891usvub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 15:47:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8fc92c5373bso5163496d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783352854; cv=none;
        d=google.com; s=arc-20260327;
        b=KsMY2FCaLS4SYb3TUTS93tJcauK/2vIi4rsYPIgW+PETu75RLBhakkblS1+x6ZXOm+
         5qI9QzJte27cb4UVeNt16VxBWXyM7gnOE2xryiyDSUVXFHH9BUppgdGY3ABjU1WLg2rv
         k1i/8It17aqn6nl/IVAZRmcxzXp+1vlmokoSagUtseky3DRn+h+cMCJ3u8dMS8fHymlA
         dW3ZzCAxpNSP9TGbI6n/l3sAwOX7U5ou7aPSHmWRpMWwUIXmXCZLmmM0emAIdpAQ4+io
         Zq2WfstCmOsFmw1z0bu1rM7AhfSVmhwSFjYDQJZQ9vvGN3+SiLGJATM/Dw5v1zGb8QjI
         Lt+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WxWaaRb93QDxqs8eJfGcKt+ODegJrM9FAhD1rn4dPwQ=;
        fh=0PrPDkA/E9RnFlwAvwbxMoJzjkyks8XZUmvLIfzWJCk=;
        b=WRYNR/5tXc/UPvvb0KnIIC8GIrZCfJC98siIZ1tOnjVvxy/tngB+BQiO6exptlbWq+
         RyN2iJY7HRX8rucPIOkz6Xzxc0YLCTWdNuu95SeG0JbQ8f4uJzAiOXqOuAttgAHJfQDJ
         nmQZbYwNrpD8t9CgPbAiyjemxib9lZmpF3khWQr/VNxDpug1IvL1JWzvSsHEQ1ZZQxcE
         LFO/43toKnrjHs+9FLXO9QQMDEJIfcDC/tjzCf+GayVyqz6ea2EjrdA5sTxIEq8480z7
         sLzq6ypZgx1g32E4gc6lh64AOWvwJs3234id6XackoXvGC14pXmCDYaHlpbCcgNfzxSu
         EAuA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352854; x=1783957654; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxWaaRb93QDxqs8eJfGcKt+ODegJrM9FAhD1rn4dPwQ=;
        b=b5N30tyfDETwVkhiEUyYq0YWYJERpSDIsUTw0FcGENI3VeGGi5MKmCe3xBOYaDSyF+
         yF5FpGTqFRSr/FJ4k6iBzUFk1Kq0/Q9w2FL5pJbhWXYJPwE0Fz3BH2rKrKhHnNMJ/Tje
         GkJC+MgZxQ8gtrnnZUk8LqJEQ2Zr6goJSBvcT9i+Z5GTfdEE5Tuh/XM37GAj2N6wCdUj
         zjZYg6iqTfaKsDSqTRKT1/ejxNkOqp71r/owdDMq0crorNIq0gl2M5qvzRsJ+cnOcRkF
         +51KXcrrqyeOrdrQpzP0Gi3OrH4AGHFgECbj09F3lk1QzBXfOnANWOBccwxo7mAKXGEn
         hfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352854; x=1783957654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WxWaaRb93QDxqs8eJfGcKt+ODegJrM9FAhD1rn4dPwQ=;
        b=PL1jMuI/JHY4ml9xY+Ja+2Rb8MSkmz+yP8wD4uD8liAiKWBWjJdhAAc9U+JgyJHiY2
         XPV9lcv/0E1n8QsNyPeGquTKs3Gle/7n1h80aKZnoWsZTPFKzxtym020V6IoYklhUvbw
         4bZ0cJheK7tki4fsO112qGVrDt4wi+GmqUleqhM/+In0MjYqDVbrmhY4toLE2VMP3mmX
         HAFeZHkocC0wJauoojVlFLx1LVUtdPCYuX2l4RxsZzrnbLqANr3JuNJCEw3yCg6WIF1j
         Hi/lc6LFSxBUEVKRVqlyHcrcFuXnWfPFDu+YVRjbxQBjyllMKx8Y4dwvM7QwAuuAptXi
         1Dsw==
X-Forwarded-Encrypted: i=1; AHgh+Ro4lOWBYN+U+GhoJeFhdcL6WpP61e6oNiWGsmWYbeXAn2VbYacI8z3jit0qkn70a3rOPq90kNAbU8bqvL7s8Hjn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx100o8jnlopzzH5sYVmVBdq2Jk3W7vlN3mHkwGxi3ZPiJHTGLZ
	FOw/h6KqosnsYvPKGIsff5oZ0tGft7l9x6fngpQc+gxC1CRP1UTN5WnQWf0KF0WklkIXgaVnxxl
	Fe8pXSGbstlV/SAFgrEDuTQpEcS9n7lvPTtbRN0jFE7uDgAqefMpprf9juK0GvL2AUHKW9u1psG
	YiyQ5mPWmI7JT/Oi0TgbdEj/3Mulmrp4N1oZ2ks/BI2BDmwhjZoqdq
X-Gm-Gg: AfdE7cl/e7BT92fR9jIRwmMSYKl7sBusQZ8cihtArGzvSZ1Ona8iKcPN0TNbb1oi/2g
	GxbJP2d7jfKNXEiqKY2v4t14HS9hNskoc/et3KTCfPr5LR2Yb91wI/CcwZqaF8PLitbC+NGxehm
	HxgqXNafUAMhFkea9O83RjCqBnEvurJl5P7gSTA1RO4kzVQUZrRlm9pRy7iC4y+hu81ZVq
X-Received: by 2002:a05:6214:48f:b0:8f1:579e:a418 with SMTP id 6a1803df08f44-8fcb56c8f99mr13325396d6.43.1783352854518;
        Mon, 06 Jul 2026 08:47:34 -0700 (PDT)
X-Received: by 2002:a05:6214:48f:b0:8f1:579e:a418 with SMTP id
 6a1803df08f44-8fcb56c8f99mr13324626d6.43.1783352853910; Mon, 06 Jul 2026
 08:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-st-mmc-v5-0-3cf0e639bff8@gmail.com>
In-Reply-To: <20260629-st-mmc-v5-0-3cf0e639bff8@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:47:19 +0200
X-Gm-Features: AVVi8CdvK6SaPleWpu9C87ndPSmgsnOwMTRoR_g7UJCEqp43DcokT7xQKZ8HiEI
Message-ID: <CAPx+jO9kjT0eMozVMiS8iot+4PEsET+Spm==p6vc7O_Eo8CGaA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] dt-bindings: mmc: st,sdhci: convert
 STMicroelectronics SDHCI-ST MMC/SD Controller controller binding to YAML
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: r7H8WbSRC-2PMq_bp2XEmp8D_8sCN-In
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfX6SP/7sZKR4hS
 idC943oEVP6D1jYSl54l73886ElZ80O09XDzeFXhOt9Le55pNx+hZD1qKY9NSwQ2qG5sK5SrQ9R
 fey4ZQ1ilOAuwATFl7jDSYFb0xpcArk=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4bce17 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=X2qA2KYq_BSYQ49XwqcA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfXxS+EbUjRReZv
 YjV3ePFzwCgUYNbaw8B27h2JF598/NmzH3IuyCZ4uAvz5FvLqLVqKockfh+tKDlm7+aSN78QvcX
 feGFrsT+2q5bs98C8Whha7d3s0gyhLgN6uUOwwXziev58nZl9xbMRCGRAi8K9A31fN8p3iuoWE9
 u5nerJOFsLTLsBDfQ2i+vBYs4dTQzEu1RK9jdbwxqnektvZ1gMgBVw7sKtAGz+nnWWOpd/src1E
 CFFHaX4f+luDkjxy+j9ZoIiEn6a1+5bKbBVGAb4aWYa48qCa7gLL1i07LgX70byuev2x3BYLPd9
 QeEjr3OTLKD5d2mwNWLS4n5vj8yTlA/pO6NPZQz+bLmI9rX/wFGeznv5Mi3WnYn0liWhc7HNP11
 MooWY84lftvaivwfEasRbUamOD4V69N1J28adLmLeUlX0tLThHzbUn9MWl04YWQIRcmFoKL9QT7
 3Vy40MiTLGIjXpx7dow==
X-Proofpoint-ORIG-GUID: r7H8WbSRC-2PMq_bp2XEmp8D_8sCN-In
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_084736_340798_55DEC500 
X-CRM114-Status: GOOD (  17.46  )
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

On Mon, Jun 29, 2026 at 6:26=E2=80=AFPM Charan Pedumuru
<charan.pedumuru@gmail.com> wrote:
>
> This patch series converts the legacy text-based Device Tree binding for
> STMicroelectronics SDHCI-ST MMC/SD controller to DT schema (YAML) format.
>
> Note:
> The patch "dt-bindings: mmc: st,sdhci: convert to DT schema"
> depends on the patch "arm: dts: st: align node patterns with established
> convention". If the DT schema patch is applied before the DTS
> cleanup patch, `dtbs_check` will fail due to the presence of the removed
> properties in the existing DTS.
>
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
> Changes in v5:
> - Rename the sdhci@9060000 and sdhci@9080000 device tree nodes to mmc@906=
0000
>   and mmc@9080000, respectively.
> - Introduce the max-frequency property and add conditional logic to inclu=
de
>   reg-names when the reg property contains two entries.
> - Modify the commit message to explain the changes done for both YAML and=
 DTS files.
> - Link to v4: https://patch.msgid.link/20260613-st-mmc-v4-0-b3c385617c16@=
gmail.com

The v5 series applied for next, thanks!

[...]

Kind regards
Uffe

