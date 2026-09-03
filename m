Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A4FC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSbHTsqtVhnjQL48exVAucFN4ABmL2gOFoCQ684rxK4=; b=PpqRRuhVAvn4TG672dl6PH2QXZ
	C3onNfFBJl2bxODixPrKuyJ606nKnF1JQGsilmAM0/Lbuc0fRNlDNaySi9jIVXLp3HMRN2AiFdaCA
	cQasHRx0DK5ZE7Fd6zQWQ6Dp8f8w+JBuBVOosBVYGSI50zgTfgd7tKawwx5hsFB7JAbhTpOijyW9j
	bsvS6YCvDplPzeJig3R5ComtQ4rFrIVmSfjZ7CItI2YipBsxN0MgUIp7OWEXR7KVSOIq/aH0oH4Th
	WGpVIO0IuoFsex31W20xxGMDi7tgI3yvJvqW0HW943GxxohUzN0f27lsSGq4JGKDLCE4TK1TS3Cu0
	0tR6RzHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26AH-0000000HG1N-3ksW;
	Thu, 03 Sep 2026 12:03:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26AF-0000000HG0v-29vX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:03:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHBsU440163
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 12:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DSbHTsqtVhnjQL48exVAucFN4ABmL2gOFoCQ684rxK4=; b=F/u5A7qEMzrjO8Pm
	yqHSeta7duGyz4XIev213chNKedcWNup8cLcDEkMPrc/rCF2poXhpjkjGkRde8YF
	H92Jefhd7xm5YDzxQxLf6oQPFuc0GUZPmVa9QurfqpyODGVMhaJh4yfnOM17EUAa
	kfKmRaf51eI2qsaO7kaNQ6giMyfhU45PZTu8R8OyS6oKBpqSTx6oWKH9j8KXr97B
	puz26z3poI9mk6nCH/cIBuN8Dkcf0vqgBG5Zj+dKW4+S3zQhWG801vUXQRjfqnm4
	G256uMqfHuGUVnxGpucCOfJimFHfr4HZmlOIl8ml+x+aPXBFuJS6+qRuvZEezql/
	21vrwA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p70fuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 12:03:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e01a62d99so2983188b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 05:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788437009; cv=none;
        d=google.com; s=arc-20260327;
        b=pbKUGSJ++ssusVdEPEEaV3y3ycK6MQfvzzNVxKuzFcA+kFLGgKJnfVWDMIUE5KBnql
         AJhuHOB2URcT8qk/N4IpKqvrMcNB+9gKmmd+b2aPiO8oUqMo+JjvbT6oHwlQYTkLssCE
         kf03Swb7jay9wK3sk0mD9bHHxVq74g1qomX/sKv508Bulp1j06c54AWbdcC+URFWjrc4
         LD7gNMPi50KJyJ6bWtp2c+h2T/j0Qi36Zv/0bljlaFvsTV3kHRw1Ay7BTr/gNCvF75No
         PfUc/UUCus50scE1HxXA1VKOMTA3qLl4zZxXj9TWXgpyxP7UM1zvNKZrF2f3+YTgPqWO
         HzUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DSbHTsqtVhnjQL48exVAucFN4ABmL2gOFoCQ684rxK4=;
        fh=2FmF+D4wB4wswnwHPy67MqDMhGMyrhYa9GTonmWlGGA=;
        b=M3hGpaoZ2dpVw0Ec/P+kTe7hfoaLqGq/9DCe3fembxUolY9EdaROxVusFObdVAnYOr
         cE0Z63Bi+5YOPTvK6DPPYCazMw7SCmA1W/qgEtvGj4atF5XEAlVOUZQF8fgQM8B8zFGy
         nxUI05PJdVVctlwEjLqyn/pG/X5f3QGrz6y6IkCxQ7FIM+UMUJEEx2KwMsVaXttfYcll
         ttQJSgujRUvKKtdhXnQWTN9/gks3wevP1tjnWA83k2q2OtJesPAPdXyWFv7zRP6yYmvs
         2Qc//VicXtkzFJdaS7lYl3JAl3Yz37xmuSzNubR5fhaKWfbo+ST2BhRWYDU+UJjXsPVU
         jJYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788437009; x=1789041809; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DSbHTsqtVhnjQL48exVAucFN4ABmL2gOFoCQ684rxK4=;
        b=EdP53Eb8n+yHGyXgvg/NAiwQOaUa/FDkgOd7fw5ATsp4ahUGgV9BNXnqZeYk3Z1cRn
         m1k3or1qa4Fsk9Kl5i1O60EYaaF9Va9VnLN7RMvTMAPtu/CCbQJqodzOyrlVJ1Uv+SRN
         ZqlWf9PUiDPb0GHN+h9Id+VbuzG3E5HXMyFkc7RtlyOJXIdTvg7k1A9JvD6jmUHm7AZc
         R/XayC8VdeD2ZxV6hOUwzwWr+vwF9DsFvWfVwP4APDubA8SGLFfmQqrYzWxZ8boIGLSW
         1oIB522N6XnxeBtATWRWxiffNPPSztzTiJ+wuyQeY/NHIl3lhH550N+03Sz3FV3qrNvR
         /OhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437009; x=1789041809;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DSbHTsqtVhnjQL48exVAucFN4ABmL2gOFoCQ684rxK4=;
        b=Cnai6PCoEhEnF9kU4i9hrxGJeJzEt+/sbi4l8CktuHin1Yk51kS/kRn1f25/X8INUa
         gZNlOvt8KsP+eqyFCzjcVTIiTgpMon3bSI6CFrEMGBjTYNh+fKQy33fowBY/e9vXMIho
         WB/bFz4CGoVhvlMrJkdr3t92e59dj+Hia4QbE0vdPrHkNjPXTJFp1BpKea+aB3jWVBLi
         5bx85YbNJKf5KiRAtp0qMgvOzPOwqEG0oo4cbgI3qTFpdO36PdGb8LZm5eetgdKyQ1h9
         HugVgDjfYJ736h4V2niz3qB4tovOCM2hQ5n83ngMv9QBJY03t3+34tPw3QTXzT72uQkx
         XQLg==
X-Forwarded-Encrypted: i=1; AKwUvBwYkBHftFnm/MqXaTx/1WWJ+P8FJnjIkwLOt4h3q3IQ2BsdlFU/OyVfYneMTdbVU+KeXxLEB6hLj3WxgjmVDL8Y@lists.infradead.org
X-Gm-Message-State: AFuF++mW1xTKGnl5Fb978rvyzPdHM6hJphDBgcqYTN4Y5t3cibHkLZ5q
	/gAv24LM+wWIGJgj3E5nCebM2KFtYsdwVTQTL7Xb9E8wZUAQgXr9+Gtt6xDpXd3+fburQdDDM4x
	eyKJ/xFxHO1XMS3UYdsqHKRY5z1xDnNFI/Q6qSF1ESzSTXhMJn8PXWFCtsNScInzTMHtlshSBge
	J80ZePpKBqA4S8XFjCVucqqJU8k7yxc8P2a6oh4A1aN3li09kyFj+y
X-Gm-Gg: AYBFou2TVxNYIl+QsjL//Niond5MNgUnu8TPgT9TFk4h2S1EfoYgDyduJvcHm3WL6un
	UXKA/dP9fSsjICrIfvr+j0M8beU+3q3tfQHS2HfiPRNsY1GlocI9DR91Y++jw63Zn5zdI4aI96x
	3fF1/V6jHME9Hdk2EbgYIuyUCM2ErqYQWEy9z4OjdRQF0GDJrt3hlndT5fcg==
X-Received: by 2002:a05:6a00:301e:b0:857:72ba:ff10 with SMTP id d2e1a72fcca58-85ed4c1b522mr17374233b3a.24.1788437008783;
        Thu, 03 Sep 2026 05:03:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:301e:b0:857:72ba:ff10 with SMTP id
 d2e1a72fcca58-85ed4c1b522mr17373446b3a.24.1788437006071; Thu, 03 Sep 2026
 05:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260831-topic-lpm-psci-domain-callbacks-v1-1-4a47d95c9c79@baylibre.com>
 <CAPx+jO85NBZq=YCxhs5Fbo5rDZ7pGHHKiG2HRJUNVKj_1SOscg@mail.gmail.com> <7hh5k87qtp.fsf@baylibre.com>
In-Reply-To: <7hh5k87qtp.fsf@baylibre.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 14:03:13 +0200
X-Gm-Features: AcwNN1Uq2Tdx3qawT7JRaungyUzupVuVJdcdX7A1icKcnMlw43ki1_-ZoYUerHM
Message-ID: <CAPx+jO8k6MNSdhmj5v4ceYr8XhgHk133LweJvRpN=kF0rHF7PQ@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: psci: Assign domain callbacks to all CPU idle states
To: Kevin Hilman <khilman@baylibre.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Scaria Kochidanadu <s-kochidanadu@ti.com>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: B38LDjV-kK-HVNGG-hOagw_S_3FBirsq
X-Proofpoint-ORIG-GUID: B38LDjV-kK-HVNGG-hOagw_S_3FBirsq
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a996212 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8
 a=13slLdO5Tp32gFNFT6wA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX9CXWZW1o3IiZ
 +IQVxZ4WW4fvcHg0VwXc8dMsOQ5Vk+gT9TiDZvd+sQxCR5B1nUows4ttYbRXvqMEOKpWvh9rbGh
 tPB3+R10b/Tj2DINkatldVDxyvpe0ag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX/kvgv7H08zr1
 l5Se25ahYExnDPLvsPcaV2KXzaVQUO628Z75617zTKPwyw4XVY6gUmnMekkUcb/6U7nh6EFE1C1
 2vzmcTguw7qRJy9SWZPccUgsFgwnO+ST3mO/qhilKYNWuLqVkmCXo9C6QEJCix3khk0/hR4J2UY
 tj5NpE4ZSBZUoFfc0+ZNMu0MTbEpX/MFVxDs+2Jqp630U2f5IPBIwWXhrrHhepFAFVcHn7ZoKyn
 2bqgVcJnHPwzrUNhvitJ3/XiPlOx/pyIoPrS5ucVDw+UJ8biADkfkMC7IZ2DtaEbuw+h2EpZuRq
 Qr3AOhQYlEvdz6gB7iQIbeHbkDAKWVW37C13kYnGAawmGcoEMKempY0d/Sq0HA9dcxYGkKC8eIR
 fdrOYrqpcLbHkL/oLP84iQYzveiZekWIjdqv3qf++2OOSIAcQxUrt7WUHkAXkweY45fpZOZPpvn
 yYLR7YfWmFDpNt+89zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_050331_684339_8E51C0FE 
X-CRM114-Status: GOOD (  54.67  )
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

On Tue, Sep 1, 2026 at 8:46=E2=80=AFPM Kevin Hilman <khilman@baylibre.com> =
wrote:
>
> Ulf Hansson <ulf.hansson@oss.qualcomm.com> writes:
>
> > On Mon, Aug 31, 2026 at 8:52=E2=80=AFPM Kevin Hilman (TI) <khilman@bayl=
ibre.com> wrote:
> >>
> >> Previously, only the deepest CPU idle state had its enter and
> >> enter_s2idle callbacks set to the domain-aware implementations. This
> >> meant that if a QoS latency constraint excluded the deepest state duri=
ng
> >> s2idle, find_deepest_state() would find no state with enter_s2idle set
> >> and skip the domain idle path entirely. Similarly, during normal runti=
me
> >> idle, shallower CPU idle states could not trigger cluster-level domain
> >> idle states.
> >>
> >> Assign both enter_s2idle and enter (non-PREEMPT_RT) to all non-WFI CPU
> >> idle states so that the domain-idle-state logic is triggered regardles=
s
> >> of which CPU idle state is selected. The genpd governor remains
> >> responsible for honouring domain-level latency constraints independent=
ly.
> >>
> >> The enter_s2idle path uses dev_pm_genpd_suspend() which is safe on
> >> PREEMPT_RT. The enter path uses pm_runtime_put_sync_suspend() which ma=
y
> >> sleep and is therefore still excluded on PREEMPT_RT.
> >>
> >> Suggested-by: Scaria Kochidanadu <s-kochidanadu@ti.com>
> >> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
> >> ---
> >>  drivers/cpuidle/cpuidle-psci.c | 24 +++++++++++++++++-------
> >>  1 file changed, 17 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-=
psci.c
> >> index dcf20ea5ef5e..db9aa57c51f5 100644
> >> --- a/drivers/cpuidle/cpuidle-psci.c
> >> +++ b/drivers/cpuidle/cpuidle-psci.c
> >> @@ -250,6 +250,8 @@ static int psci_dt_cpu_init_topology(struct cpuidl=
e_driver *drv,
> >>                                      struct psci_cpuidle_data *data,
> >>                                      unsigned int state_count, int cpu=
)
> >>  {
> >> +       int i;
> >> +
> >>         /* Currently limit the hierarchical topology to be used in OSI=
 mode. */
> >>         if (!psci_has_osi_support())
> >>                 return 0;
> >> @@ -261,14 +263,22 @@ static int psci_dt_cpu_init_topology(struct cpui=
dle_driver *drv,
> >>         psci_cpuidle_use_syscore =3D true;
> >>
> >>         /*
> >> -        * Using the deepest state for the CPU to trigger a potential =
selection
> >> -        * of a shared state for the domain, assumes the domain states=
 are all
> >> -        * deeper states. On PREEMPT_RT the hierarchical topology is l=
imited to
> >> -        * s2ram and s2idle.
> >> +        * Assign the domain-aware callbacks to all CPU idle states so=
 that the
> >> +        * domain-idle-state logic is triggered regardless of which CP=
U idle
> >> +        * state is selected.
> >> +        *
> >> +        * For s2idle, enter_s2idle uses dev_pm_genpd_suspend() which =
is safe
> >> +        * on PREEMPT_RT. find_deepest_state() will pick the deepest s=
tate
> >> +        * whose exit latency fits within the active QoS constraint.
> >> +        *
> >> +        * For the normal idle path, enter uses pm_runtime_put_sync_su=
spend()
> >> +        * which may sleep and is therefore not used on PREEMPT_RT.
> >>          */
> >> -       drv->states[state_count - 1].enter_s2idle =3D psci_enter_s2idl=
e_domain_idle_state;
> >> -       if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> >> -               drv->states[state_count - 1].enter =3D psci_enter_doma=
in_idle_state;
> >> +       for (i =3D 1; i < state_count; i++) {
> >> +               drv->states[i].enter_s2idle =3D psci_enter_s2idle_doma=
in_idle_state;
> >> +               if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> >> +                       drv->states[i].enter =3D psci_enter_domain_idl=
e_state;
> >> +       }
> >
> > This breaks the current contract for genpd when it tries to select a
> > domain idle state for a group of CPUs that shares the same PM domain.
>
> Could you elaborate on what that "current contract" is or point me to
> where it's described in more detail.  I understand there was a reason
> for this design choice when first implemented, but now that we have
> added support for using QoS to constrain the state selection used for
> system-wide suspend (including s2idle) this "contract" is really
> restrictive, and doesn't allow the domain idle logic to be used at all
> for shallower states.

Right, that's a limitation we decided to start with, simply because we
had no use cases back then.

So, if we would do the runtime PM reference counting when entering a
shallower state for the CPU, it would allow the genpd governor to pick
any of the domain idle states for the shared cluster PM domain. This
doesn't work as is.

The CPU PM domains are structured hierarchically and the child CPU PM
domains that contains only a single CPU, don't have any idle states
that are managed by the genpd governor. Instead those states are
presented to the regular cpuidle governor as per CPU idle states.

>
> > In principle, if the CPU has a clock gating state (shallow) and a
> > power collapse state (deep), it would be sufficient for the CPU to be
> > in the clock gating state, while allowing the cluster PM domain
> > (through genpd) to enter a domain idle state that corresponds to a
> > power collapse state. Depending on the platform of course.
>
> Yes, that is possible in principle, but with an important clarification:
>
> Once all CPUs are in an idle state (either shallow or deep), the domain
> idle state logic is entered.  It's then up to the domain (or its
> governor) to select the appropriate state(s) for the domain.  If any of
> the CPUs are in a shallow state, the domain governor should not allow a
> deep state.
>
> In your example, you mention the CPUs in a shallow state but the cluster
> domain would pick a deep state.  I would say that's a bug in the
> PM domain (or its governor) if it would allow that.
>
> The job of the PM domain is to pick the deepest state that is possible
> based on the state of the devices (including CPUs) that are in that
> domain.

Right, I see your point. So in that case, we need genpd (and its
governor) to know about these per CPU idle states, as that piece of
information is not available today.

>
> The same is true today for domains that do not have CPUs.  If you have a
> device that runtime suspended, but in a shallow state (e.g. only clock
> gated), the PM domain it is in should not hit a deep (power-off) state,
> otherwise that device will lose context and not resume properly.

I totally agree that this problem isn't limited to CPUs. Generic
devices can certainly have support for multiple low power states.

At this point, through runtime PM, we support only runtime suspend
(not counting runtime idle), which means there is only one low power
state available per device. It's only PM domains through genpd that
currently supports multiple low power states.

For a CPU device, it's slightly different though, as we have decided
to model each CPU to have its own CPU PM domain.

>
> I'm trying to enable that same thing for PM domains with CPUs.
>
> > On the platform you are working, is there a clock gating state (or
> > similar) on the cluster PM domain, which is allowed to be entered when
> > the corresponding CPUs are in the similar state?
>
> Yes.  Not only the CPUs have shallow and deep states, but the domains
> can have shallow and deep states as well.
>
> Kevin

Sounds like we have a BoF material to discuss at LPC...

Kind regards
Uffe

