Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A30C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Jun 2025 12:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7F8/U+mi73XJ2L7J7qWmJE6+y5i8b44RdJ+g6ZHMcI=; b=gWKD5FG04KGKIb+MoojEKI+k28
	PE/Dri6PkiwKGvd9NhKq621+RVjgWM6uZ6/sJJRQhede6yQ0wUHE84TIXtROA3dlleMHlsbGG5NZM
	+HTAThGnQFofqxFSpenGojUsf1r5ELgBTr2dypcY3XESJMfZ5oiwpvXWQRGlhbpGj9sLUKX1HFy3T
	MA6NlTgf46fNHtJlJRVVUBqAgDQfy3F+IEnh9LYKAGkVpo1BeOJydu+vkP/aQyK3ZWXtTkHsZOpos
	vHxpblmaSacJC3nTLT7fZjl7kS/JA6RYFSovoWboPPWAIDcuRuyrfSc5eKhzWv3nzjTMFChEQss5s
	XvlLcrTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTJnH-00000000qDi-3Zhr;
	Sun, 22 Jun 2025 12:27:31 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTJjv-00000000q3e-1kB5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Jun 2025 12:24:04 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55M2t9VA032052;
	Sun, 22 Jun 2025 12:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Q7F8/U
	+mi73XJ2L7J7qWmJE6+y5i8b44RdJ+g6ZHMcI=; b=efjBIm44OX5HPReK0KT8gO
	/Y0LeLWtO8RgrRMimsgifSaxZQqFFoYVTi4gfbhFcdyJzg37hRbofMoD7ikLkvLq
	VXeWTClN/YMP4EvVgR8jrIPI8X5p+NLVOy5tsZ6qY1A1cov2aarhrG+/nmTCIe2C
	mDpPMH2+kvi5n3eYc6WGyBhIVTmmCSnxJh3SshnCziEsO6acTFT/ZXO+vmtrT4/c
	7vuEPXfWpBZiakjbXuNarqPzGKnVDP5i0muotY4oZusU1aJh7WX1/KOlROKOKncC
	JR78Vub+laygydGRLvBDKswrlAafnaDq0iqa2tVas9XcxOaF5Ah9ZTGCA5/RyzhQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8hvpp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 12:23:57 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55MCNv1O024687;
	Sun, 22 Jun 2025 12:23:57 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8hvpp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 12:23:57 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55M7eBw1002568;
	Sun, 22 Jun 2025 12:23:56 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e8jksmua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 12:23:55 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55MCNtAA24118004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 12:23:55 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35A2558056;
	Sun, 22 Jun 2025 12:23:55 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B7C158052;
	Sun, 22 Jun 2025 12:23:54 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.92.25])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 22 Jun 2025 12:23:54 +0000 (GMT)
Message-ID: <82acbfc071095da7cc153ec8f2fbdca6316c82bd.camel@linux.ibm.com>
Subject: Re: [PATCH v4 2/2] tpm: tpm_crb_ffa: try to probe tpm_crb_ffa when
 it's built-in
From: Mimi Zohar <zohar@linux.ibm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>, jarkko@kernel.org, sudeep.holla@arm.com,
        peterhuewe@gmx.de, jgg@ziepe.ca, stuart.yoder@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-integrity@vger.kernel.org
In-Reply-To: <20250618102302.2379029-3-yeoreum.yun@arm.com>
References: <20250618102302.2379029-1-yeoreum.yun@arm.com>
	 <20250618102302.2379029-3-yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Jun 2025 08:23:54 -0400
MIME-Version: 1.0
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDA3NiBTYWx0ZWRfX8TnzgF/9CxZc 4VXGQ3mJdEYXHR0EbygG6IMVeHVAyZhhAipmbftjbNOQqK/MItklH8swl7LDw4XOzFgtpvD29vX bbDLGr2ZrCUuJ0JlgqrBOhDAd6jmHJKrELYolZc6yrESr71T3vuE/GZrsHG51/gnIZIgARFvZNc
 6xteH/mlCins3SZkgmPsG2QDLbL0f61d6hYacBlMjQZfoNOV8mNZStDLWPhkQTTr6ZH+MMCLiIz pxukxj1fTADDUYsHKfWDlKEPe+jqWi5wr7axE6AmJRU6+49Hf0TNpc9pSHJukT7WGZF1gnXJveR G0DLlousKZFm8Odg18s9hdo/Og7FDsfHn2mqkztuNQeTvnky/JxWKseWhVMyFFEBtOr67ewhQ38
 i1sOMYKHiH9tqHLGwOgMUwDV241YMuuVaJbHoxTkDJLrljQWzJphlf98n5yYG5zAPWjwyhF+
X-Proofpoint-GUID: FtRl5aB2iy992nm6u0N62rVbDKcdzle8
X-Proofpoint-ORIG-GUID: BWgFVlbVuMyff2u4xjoRrzmut-6DCtPI
X-Authority-Analysis: v=2.4 cv=combk04i c=1 sm=1 tr=0 ts=6857f5dd cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=7CQSdrXTAAAA:8 a=VnNF1IyMAAAA:8 a=dY7dXPFekxP_jGxdfwkA:9 a=QEXdDO2ut3YA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_04,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506220076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_052403_459233_9080F351 
X-CRM114-Status: GOOD (  31.31  )
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

On Wed, 2025-06-18 at 11:23 +0100, Yeoreum Yun wrote:
> To generate the boot_aggregate log in the IMA subsystem using TPM PCR val=
ues,
> the TPM driver must be built as built-in and must be probed before
> the IMA subsystem is initialized.
>=20
> However, when the TPM device operates over the FF-A protocol using the CR=
B interface,
> probing fails and returns -EPROBE_DEFER
> if the tpm_crb_ffa device =E2=80=94 an FF-A device that provides
> the communication interface to the tpm_crb driver =E2=80=94 has not yet b=
een probed.
>=20
> This issue occurs because both crb_acpi_driver_init() and
> tpm_crb_ffa_driver_init() are registered with device_initcall.
> As a result, crb_acpi_driver_init() may be invoked before
> tpm_crb_ffa_driver_init(), which is responsible for probing the tpm_crb_f=
fa device.
>=20
> When this happens, IMA fails to detect the TPM device and
> logs the following message:
>=20
>   | ima: No TPM chip found, activating TPM-bypass!
>=20
> Consequently, it cannot generate the boot_aggregate log with
> the PCR values provided by the TPM.
>=20
> To resolve this issue, the tpm_crb_ffa_init() function explicitly attempt=
s to
> probe the tpm_crb_ffa by register tpm_crb_ffa driver so that
> when tpm_crb_ffa device is created before tpm_crb_ffa_init(),
> probe the tpm_crb_ffa device in tpm_crb_ffa_init() to finish probe the
> TPM device completely.
>=20
> This ensures that the TPM device using CRB over FF-A
> can be successfully probed, even if crb_acpi_driver_init() is called firs=
t.
>=20
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  drivers/char/tpm/tpm_crb_ffa.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/char/tpm/tpm_crb_ffa.c b/drivers/char/tpm/tpm_crb_ff=
a.c
> index 4ead61f01299..462fcf610020 100644
> --- a/drivers/char/tpm/tpm_crb_ffa.c
> +++ b/drivers/char/tpm/tpm_crb_ffa.c
> @@ -115,6 +115,7 @@ struct tpm_crb_ffa {
>  };
> =20
>  static struct tpm_crb_ffa *tpm_crb_ffa;
> +static struct ffa_driver tpm_crb_ffa_driver;
> =20
>  static int tpm_crb_ffa_to_linux_errno(int errno)
>  {
> @@ -168,13 +169,23 @@ static int tpm_crb_ffa_to_linux_errno(int errno)
>   */
>  int tpm_crb_ffa_init(void)
>  {
> +	int ret =3D 0;
> +
> +	if (!IS_MODULE(CONFIG_TCG_ARM_CRB_FFA)) {
> +		ret =3D ffa_register(&tpm_crb_ffa_driver);
> +		if (ret) {
> +			tpm_crb_ffa =3D ERR_PTR(-ENODEV);
> +			return ret;
> +		}
> +	}
> +
>  	if (!tpm_crb_ffa)
> -		return -ENOENT;
> +		ret =3D -ENOENT;
> =20
>  	if (IS_ERR_VALUE(tpm_crb_ffa))
> -		return -ENODEV;
> +		ret =3D -ENODEV;
> =20
> -	return 0;
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(tpm_crb_ffa_init);
> =20
> @@ -369,7 +380,9 @@ static struct ffa_driver tpm_crb_ffa_driver =3D {
>  	.id_table =3D tpm_crb_ffa_device_id,
>  };
> =20
> +#ifdef MODULE
>  module_ffa_driver(tpm_crb_ffa_driver);
> +#endif
> =20
>  MODULE_AUTHOR("Arm");
>  MODULE_DESCRIPTION("TPM CRB FFA driver");

LGTM.  Using ifndef/ifdef MODULE is similar to how module_init() works for =
both
builtin and loadable kernel modules. Except module_init() is on the
device_initcall().

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

