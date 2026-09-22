Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68694C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 19:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66fYIWxsQudt93HBnJi2uy8V6Tpbsup06vZEiSMqw5s=; b=Ln9rHP7PYCcAd7URMZiTTQxnTD
	v3NRRI3bv+IAH73dhHy5fkV1P5829tHKXdItiF7ak2LiBzSXDQ00ytX/uvM1RGcNkP8cKOzF9mzqE
	9T2ThuE+Vs3LmCMgvPwQP8eLEZRHdMcmQRWqgoapKN80u2jSHijfNgRA/OrZ8bL3+f65h79CxOGDO
	r5PEbfB9RSRhGjeMLcHskSqhtfhKikkJPmJWBvF5ps3ZJPYNFOrjQJ4aZNpttwRRRwjVnT0jiu6Fp
	ZAo4bVy8YUb0cI9ZBCgGGLtjCgfrI0lJuJ9wPcwmkZkEhpxJSY2SFGxE5pRqdAyiwz3F7IZekp4zN
	ptUb68fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96E0-00000006Q7a-2K8J;
	Tue, 22 Sep 2026 19:32:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96Dy-00000006Q78-31NF
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 19:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=66fYIWxsQudt93HBnJi2uy8V6Tpbsup06vZEiSMqw5s=; b=ptXPGJrc2okrl3MUmaR/ixIimv
	DG0yOT9y+E1xB7+4ZWuzs2jRUsal2vWeO28h/APG4Bq1erXlRSLVBXs9xorXxEodneu/AJcZ1y6D2
	GMHz7iXEdSgGp5uUMRP8nY8eTTp3XCKZw7UWIfqcrDx6MCCL8dHW1f0ZUZaGHimMtV+33sz2DVoov
	Zu1WHMAN9A5cJylRxPz0wdp9eP4WbuUIkUUkT2j2bpC2ZcoZE7zQ0oXbohrSdoSp1PnZAFeAN6KCv
	1217kavInWcXk/Ku0wHOfP6zUaAwTSZZdiTNLf8LAzOhSZriwf5fJdreAQCwMe2lE17FkOQxk5ekT
	SW+LT5Fw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x96Dv-0000000E3q1-0bi8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 19:32:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7A3W1154375
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 19:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66fYIWxsQudt93HBnJi2uy8V6Tpbsup06vZEiSMqw5s=; b=mCBOY85KbLe6Pzpu
	w5tm5HyGuUICD9mdEO3H8lTMZIUCpf8AFei1DXXS08QcLVEtJAxzdKRouWwQSc8h
	43rMJ5W1G/3/MVoZ2NVTiP/aQRMF77qEnmqQr2ICtHVBKx95XcXwwBBhZhzUNaZi
	4ndM2W/aTGtdu7zacVeMqWQ2F3VzLdj4PunQFUE+vprQYm/aptc2G6sRML9ovMWo
	yGS6qAyhXuNhOmXGFzD0eUXu9QZnEXJqdkkYXPyREtygffmSqExP88MnuZblKRRl
	XasuB15LtZUeR0l/fOncloKgrNSR+OdcY5agE8c8BwuZJn6mILvg5/4XKbLOSOWd
	p2gtXA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guvw7h2j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 19:32:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so179066eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790105531; x=1790710331; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=66fYIWxsQudt93HBnJi2uy8V6Tpbsup06vZEiSMqw5s=;
        b=AkXoW66pejUx+eVBozNB43hNz56JKwBUJ6dvmd8ySLVRtnAIRGvebM5HRhVyNuhIdI
         nGtX1vhHXawi9iGr3C4IZyCs8cNvUnOBhY5M17zJ2KNGPfhDxRGWNP11vvkrgW5WmDoF
         i6AyzKKFva9QYehVWbCjYaHsLk/cAv89trMb3jC+MKH86sgIcFZ6oQ0AbYapYj/xd1j8
         feCoS/FLZQmLFSyOO91QhgksQADmzBvIWFxculrs1KkkM2CQMtyKvHwCRP42PJp4F11L
         PRZohN/eHwA5u7f/ZzWvLBj3DC12RsRzAvlZOmLcn0N1UXxKuoe8s1i6mh4k5Q4y3V6+
         RiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790105531; x=1790710331;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66fYIWxsQudt93HBnJi2uy8V6Tpbsup06vZEiSMqw5s=;
        b=WbbVAxMbHUyq0z1NZYE7hqQB9dZCjcUWkhFFaSLPjxuaUPrT6yIN7PdAealFfsEk3h
         248IhuWTSJpasaKjBoWcY7w/+BqjDtfdFolEj8EdomGLkKYBsROOPgFrFc8mHPS0F6nC
         vQVKtX8zvAqhoOA68HPrY9t9SsOd51j/OrOhbqsRq/XnnexyF40e+k3czZjwrynH2XnV
         HeUuVHpkKbFfkUOjIAf2qc6D/2JRdQTobuJt2Rtk2K5tp4XcxKBMiQ97zIv0K9Mss+lZ
         DdpZb9pyd+FL6e++MpRk3GmH+aGgyuEsFjLIwNHL+KIGjaRLjCPSthoUuFvkX+zNwedZ
         3vQw==
X-Forwarded-Encrypted: i=1; AKwUvBy947BgQTELQBGJylKFhlVQYA9wjwugQv9iQE7hXpOSRy78B5UZIEZeuVhBS8OcGsYSP21rMbgH+XUfBUS+Hfzq@lists.infradead.org
X-Gm-Message-State: AFuF++kcGbpPaTcWjiRwSZneyjXl/Ty5UexyESg8IyYa8s7vk/GjcUCj
	FhaUexbER7HhPKPTgufhJQN6kut+vPKjSCUC5PzE2mrBW/mQCh0o67qLzhKfoFaC1L9iPNBFzaI
	R085LEePxMrnKdQxlAOqdh42f3DSOicFMoZNFK92YXKa2KFroEvfyhJzhPPXnkyEuREgwLNUlPZ
	6yTw==
X-Gm-Gg: AYBFou2xdO/B+XS98Vd4fLTsNBlyWM2WdGH+KsN1prsI0r/kBMECjUlLGWPATJZjVyK
	5cBeQmgq9TZ9JyFSPPaYNepap/hIZeHsm4KaGhLYRGWn83NhlK24CcrNJ/zt0GcWOzRknaRuBmL
	cTl5EjOXCWo6fMQPNYEVY529DbgMb8D+xdx0Cj1i1v9pMXCrng2G86tBbB7tFloinRegpujAmDS
	KkMRcFjsHKczZMHb+zO6GF8cns4mviSFbi4qJStM0HSvJW4MThfWkICqlfeRwl1RaMK2GFowxF4
	lFV2pvRXeQzolXH2/3Ur+MW2+ZdQd+Gt/L3ff3KaKanj+K+tiF/I3KKVT8Fziu6K23VwzlDznlG
	Jsjlo5QycIxYbVnNF3irCTYiEUKvwqz0HiG18dYX8t6IwaR9j4/pc+Z0=
X-Received: by 2002:a05:7300:e9cd:20b0:33c:5cef:1b97 with SMTP id 5a478bee46e88-33e8c24ccffmr310627eec.11.1790105531319;
        Tue, 22 Sep 2026 12:32:11 -0700 (PDT)
X-Received: by 2002:a05:7300:e9cd:20b0:33c:5cef:1b97 with SMTP id 5a478bee46e88-33e8c24ccffmr310598eec.11.1790105530772;
        Tue, 22 Sep 2026 12:32:10 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96358e2bsm386472eec.16.2026.09.22.12.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:32:10 -0700 (PDT)
Date: Tue, 22 Sep 2026 12:32:05 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
        Fuad
 Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH v19 03/20] KVM: arm64: Include kvm_emulate.h in
 kvm/arm_psci.h
Message-ID: <20260922123205.000019b4@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-4-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-4-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI4NiBTYWx0ZWRfX4NjQKQ9sfIWL
 V1ab0cHaovLnVSAKlOQ70pHCwLjV/FBEGzETH7kMmxwp1ctLNZCnPCD/TF8k9Bl2mXuJRurGZdD
 fkp2+4YzA4XML9tzYRfTQ94tjwX7JDc=
X-Authority-Analysis: v=2.4 cv=ZYqIpcVA c=1 sm=1 tr=0 ts=6ab2d7bc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=NCrhtLsLQcMXYuDHnY4A:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: tlIPCiA6t-6S4UjmAIJSDQHsD8fAZcKS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI4NiBTYWx0ZWRfXz9XelKASbT/v
 wTrxvzIttUOhnbBHi6V4kHz8yuBPpO7AIUivr4Ggs7zLVOpi16PdgBmMlBTJM/+AmqD4IYHfvqs
 ahK7Jzuzcv3rCOjzITTmHLsiXb0L72XSbH3X8y5reMMNyIsqm2ocEZnohc+VqE5vrFyuwoB01mf
 2V0RREy6ugOb4pti2gbJb4lAe4j6RISX5LJ6R+uvdc8E8+MudYgln28LncegAgQkHSfFhUaDZNn
 LC7YsjO+bbKHHpZoP3diexa2mCUXS0OdOQCUAZCxSTUR51HVEUMHfI38gOK7NfjrLJpwlEPBpwr
 8KUmWwekbXlanZ1O03Iu44gDh+HfXf1Z5NB/m36rQp1GXEODymqDfOUjccHpX4YbTK15mbprlad
 trkzSZhAo+gwolNXg8QwuqjDljT4cyMBXgfJq0f653I56EwysNho1CnfiNKnIp8AsOTCwPDNxZl
 yUw7+Waaqf2ZL58vgsQ==
X-Proofpoint-GUID: tlIPCiA6t-6S4UjmAIJSDQHsD8fAZcKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220286
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_203215_726429_EC7E4C8F 
X-CRM114-Status: GOOD (  18.34  )
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

On Sun, 20 Sep 2026 22:28:28 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> Fix a potential build error (like below, when asm/kvm_emulate.h gets
> included after the kvm/arm_psci.h) by including the missing header file
> in kvm/arm_psci.h:
>=20
> ./include/kvm/arm_psci.h: In function =E2=80=98kvm_psci_version=E2=80=99:
> ./include/kvm/arm_psci.h:29:13: error: implicit declaration of function
>    =E2=80=98vcpu_has_feature=E2=80=99; did you mean =E2=80=98cpu_have_fea=
ture=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>    29 |         if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_PSCI_0_2)) {
> 	         |             ^~~~~~~~~~~~~~~~
> 			       |             cpu_have_feature
>=20
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Seems like some of these precursor bits would ideally be picked up
asap - though that does confuse the LLM magic.

> ---
>  include/kvm/arm_psci.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/include/kvm/arm_psci.h b/include/kvm/arm_psci.h
> index f86a006d67136..06c20612e9e7d 100644
> --- a/include/kvm/arm_psci.h
> +++ b/include/kvm/arm_psci.h
> @@ -10,6 +10,8 @@
>  #include <linux/kvm_host.h>
>  #include <uapi/linux/psci.h>
> =20
> +#include <asm/kvm_emulate.h>
> +
>  #define KVM_ARM_PSCI_0_1	PSCI_VERSION(0, 1)
>  #define KVM_ARM_PSCI_0_2	PSCI_VERSION(0, 2)
>  #define KVM_ARM_PSCI_1_0	PSCI_VERSION(1, 0)


