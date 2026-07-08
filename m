Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9E5C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 16:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXMZY/w5WVF0nRMX+GxiSjwNGLzZb02w3JE1D3SfZP4=; b=remLBJMFQJHOAPh4+BcXMpy57z
	f1ZOk2hxeekXqmW9bpKjOFWg+oDi2qGU/I+uWXd6Ttw/gjb1d9MayyyFThnmwRantqFLimzuL3uV/
	K6lyb8ccQ6FfSggI2dvYhHrdN0VpjX40inVPgdxFytHqBdD/wNpBQHf2BvsKz+Arw0CwYQODaWys6
	Dk2V7DIL1r61iL0cS/1c8bZZbLhYx83I6vydk8D8w+6zTUIuemVejOhodT1Kck8K5JKuW2wcXXB4K
	SUulv2FCBtnFvsT04ImUOdQHd1akMcldsYn6TbCQ0hrx0Qt8ZQGacNc4y5hIoUx0h3WMwYSbsMfa1
	2OuhkUyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUgt-0000000HY1u-3kPK;
	Wed, 08 Jul 2026 16:00:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUgr-0000000HY0e-0qxX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 16:00:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3DnK2792087
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Jul 2026 16:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pXMZY/w5WVF0nRMX+GxiSjwNGLzZb02w3JE1D3SfZP4=; b=joLcvzannCuf3Ryg
	V2K/EMBuiTgNwVujenQonsGEky+ayxJmShjkbJJt+EoBPez1XnLbujmHhejHNZC0
	sUKxfVr97r+FGeWuLbLSlfpJNGv5X40kvQS9OfFowNKaZFN5vmf71h/iGriZzweE
	JjL3aUgfWB9AERjWRq5Y4SYXQw0CVyiY7KUVJ6oYYf4daNwD2oYozgpvCNb2bXnn
	s4WrxFtKp4DQJK42g7VBjAGqT7XRrEZr4GbO/EeO8sJuyiS93gnHiwTDFyQHyNh1
	QomU2GcRbfc2ilhey5UZFJ6HOjjwCNYRFGx4rMNcFXkG3UbcPQoi+0QX6sJInlzh
	Mf6XTQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cswbb8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 16:00:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91ed0e140c5so163671685a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 09:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783526399; cv=none;
        d=google.com; s=arc-20260327;
        b=nEfxw5kdHEnGK8EPWzK8maOFJYim9J03B2BvPR4cPpOXp8+8QESltaGZ9xEMTp77CA
         GpZZFGjzs/39DC6pCFiO9eibmHM6NfcWzn/PtEDufGccldIQaJ5102aNJBdcgDVb0lra
         vKuvqMZyfdlkmhysWAJ8jVM2xWG1eieAlRkDVvEK9qpyz9tj99u2UDa875ymBlWiqzxn
         qWJWWHLQGUDoS39klmcjOF0DW/WiDJxhZNxTlIyoqrm2qjByJQa9MSdn1F6R0IdGyzFN
         dQRI/NLRK4a1TKDji5rINREJ9qWJ6D0P95qZiXelWXAB8U4SHuimEqO3ViN3ZAEf0HP2
         9yMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pXMZY/w5WVF0nRMX+GxiSjwNGLzZb02w3JE1D3SfZP4=;
        fh=tBZXtWUvjnnf9kJ1owSIc2+HEU9v2gnlmpReEjyD1J4=;
        b=d0yqLrJNKhgI5jVmw26ss46tbUGH396sDw6gqMv+nMoo6qagYl0Z4MEk7EIr5ltioh
         vsgVBQI/CkUetF9Soq405ATS9BaKaWe6ZRTU8k4fj2IBOY71wVbOODGO0caeTIEtsk21
         4NOyHl4ry5P39k299OFo2OyPdxdZlvFjsOIP/49TzejV3j8pQQOC/4NFcizj0bWshakF
         aVoSlKtqTqOe6ksb7tVFalZHJWt9onbuV/kgsnFq/uwydr38yot/qzH2mXTgB2y7xKs2
         7OtIK+LZk609tAA2KRdS8v7iRPLVE4XFAOSPvRL/xoCiP8Vf2sxVu4t6WIBCxx6BVPLS
         MVBQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783526399; x=1784131199; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pXMZY/w5WVF0nRMX+GxiSjwNGLzZb02w3JE1D3SfZP4=;
        b=Uiz9BBPZ/Pn0047MLCDAKAdW0ljwUWKHqMX1ccGqSNq9+gEwDxD8oWxqZIwMZPYfUK
         7OagxfQyJOPK6ROEJqk3wk7WcCAMxbJnZPzhd/Y/uRCQl0oqLtbirfiOSei0NqnHKb6T
         8aHRoClvyqF3YfKuTqUZjM5TOqFO6ZvzTbETsTDOxcwHv/kKgWdjLMVeGrTRu3xRZPXC
         /762W4EWminB0/BCKMlJ74MyNg0ZO+qvgz3cRsThNaOmEaTx8nQccAVU1bGlKuaDhnPk
         Rvpp0ZlC7C8AuK4cD0BoxtAj7vTbRcHqd9gCfSAAdz7pDejFmWmKdvfJOciTSsTkienp
         wpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783526399; x=1784131199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pXMZY/w5WVF0nRMX+GxiSjwNGLzZb02w3JE1D3SfZP4=;
        b=R8FW8W/9w14ayIHLsj6dq+xdEHH0F5ccSG+WX47E4UmblQFwEZoRlfVZMNg9GA/3TD
         xzWhNLnCOC3j9c7VIb85AzYlKvHRQ7qjGB5ks8PJc3pm3stGde0V3GmlaLgWdLpm+5vs
         QAXBGa+zeLMeWUA+Nhfy84gSJiNgaS2b+noPlIBJ1AigpONmOj+Ll+UKh2+ydpIeL5s3
         ayQ/y1QkCdL4qcJpfbCfiVzuv+KsMkEdwWxt8KTVbBe24mZwGrtf2tgPoch5qrtDW25W
         gZbCOPwIVAJNwG3697v2hQi+hfkSRZk9kvAOrVzs/SJ57uHoR4yGuTqkt2n+xWuao2my
         fSkg==
X-Forwarded-Encrypted: i=1; AHgh+RpQPEfgcvKG67MwRIhbxS8bmvD8Qr0FSdsgLeH9tbZGPzfUUv1yJ6o0/fhYkwRm4pbBNhLdxCYxLZcBgK477+nZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyYsELpgGhw90U+vIoG7rnU41aA/5u5Nw+iy4uX9fYNHiqbHPuy
	vIJv5gGTMsm5PnitqqQlt27Bb5JE9K8UlPqjv9gawlQs3+cBYQL0T1KzJtjLdWQtuMFwqEub82W
	69zzAa+myBIdOLhIhS+k6kUiFBi/6WlBXEH/94rDDHJMBK1ikY60jenZD8G11Kr2jJiorYCFkdk
	1sGpNv8tfkZQ38MaC7HTsujRjzpAFP93ZSp462sJMI9NyDpwb2HKA9
X-Gm-Gg: AfdE7cl5109QchMfNHT4xhaZ8rm/pmfFgADXSd6xPTMPjF8FTGdSK68iHGASfN3yXP7
	UDWBzFtj/cyC70ryBblbNyh+w62+yThXIHYzp0b3ky6VIuGTYyVS3RxcGOV73jau2VlcxpJaMyx
	qch2AyKpZ7/VE5RkEl7XE5gaFH36wNS8eAYtIhbg5jw9K+2Q7ZbSIsLlqWy8m3Aq8pcW0n
X-Received: by 2002:a05:620a:1a07:b0:92d:e54e:72d9 with SMTP id af79cd13be357-92ecf5c527emr315769685a.1.1783526399423;
        Wed, 08 Jul 2026 08:59:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1a07:b0:92d:e54e:72d9 with SMTP id
 af79cd13be357-92ecf5c527emr315764985a.1.1783526398870; Wed, 08 Jul 2026
 08:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260610-b4-imx8mp-vc8000e-pm-v4-1-v4-0-ea58ce929c84@nxp.com>
In-Reply-To: <20260610-b4-imx8mp-vc8000e-pm-v4-1-v4-0-ea58ce929c84@nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:59:20 +0200
X-Gm-Features: AVVi8CdAnkt7W-EK3sRgfNkIzKWDE74xqiNiWEwP6a_AAGRkEBuSzmKj65KtehM
Message-ID: <CAPx+jO-NMUPfXJpSUa09VrA=naiiFTMpg0qzqi4QeYbeeK3SkA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pmdomain: imx: Fix i.MX8MP VC8000E power up sequence
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Daniel Baluta <daniel.baluta@nxp.com>, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 8imV90glQmWqJ-lBpk60e9PNGpW_V-QE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NyBTYWx0ZWRfX3Q0AougydTvZ
 K+XFhOMZi4JEvxSbc9z0LGqLP08MDiT0wmGRccWCtsHkTugPExJ+riaL0IwL89Bo2HZSDL/BhHj
 jJL0oK82Qpk4IKuZCTREfvhKiBQ676Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NyBTYWx0ZWRfX5ttmyhR31WAp
 4apeaF+ykVNbvIqdgeAS8oa/2I9bJi7rKgqKwAMlux7YC9t/oYVDkQy0VAA4C65UftuYxJK8VQR
 212mjc9w0ZuN4IRAcQKp1dzVSMrByDBh6Kcn29T2/oQpiSwQw9L9FRL7Cfw3TUa/mwkoBZl4RSL
 +llBhWUVSBSQMNEqX6PNinXtAwWCKMpyqDqWWMOaLXMBkLGDxf/Cq4CukHtcC12N1OLkz5Y7hHe
 AHc3rQUUC+6GGf8/tTdFfeQTYUQ3yyCuCz8YgxdVQZ8pZIOWLrWzwGCWtAeVw0A7XljDUWZAHDk
 XBTRo4xdLJY8McvnTiRta8ou+90bTBGa0NJuWPq7Z/wJOg8kJSNm+azYaLR5cbkeLjZhV4pyVDP
 9COg0mFYw57zpmKwDJfpeGc/9A1mxgVjwscBcls/zdft/mwslS478SWVxmcAwOHslSF7GX9xiFR
 1WkOmLANm/BBLUA85jg==
X-Authority-Analysis: v=2.4 cv=HaYkiCE8 c=1 sm=1 tr=0 ts=6a4e7400 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=P6ToQuPI3Mtl0Vbz5-oA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: 8imV90glQmWqJ-lBpk60e9PNGpW_V-QE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_090001_275659_8867C1CA 
X-CRM114-Status: GOOD (  20.90  )
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

On Wed, Jun 10, 2026 at 3:22=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> There is an errata for i.MX8MP VC8000E:
>     ERR050531: VPU_NOC power down handshake may hang during VC8000E/VPUMI=
X
>     power up/down cycling.
>     Description: VC8000E reset de-assertion edge and AXI clock may have a
>     timing issue.
>     Workaround: Set bit2 (vc8000e_clk_en) of BLK_CLK_EN_CSR to 0 to gate =
off
>     both AXI clock and VC8000E clock sent to VC8000E and AXI clock sent t=
o
>     VPU_NOC m_v_2 interface during VC8000E power up(VC8000E reset is
>     de-asserted by HW)
>
> This patchset is to fix the errata. More info could be found in each
> patch commit.
>
> Sorry for sending v4 at 7.1-rc7, no rush for 7.1.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

The v4 series applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v4:
> - Add R-b
> - Set is_errata_err050531 to true for vc8000e
> - Link to v3: https://lore.kernel.org/r/20260409-imx8mp-vc8000e-pm-v3-0-3=
e023eaa245b@nxp.com
>
> Changes in v3:
> - Separate power up notifier fix into patch 1
> - Link to v2: https://lore.kernel.org/r/20260228-imx8mp-vc8000e-pm-v2-1-f=
d255a0d5958@nxp.com
>
> Changes in v2:
> - Add errata link in commit message
> - Add comment for is_errata_err050531
> - Link to v1: https://lore.kernel.org/r/20260128-imx8mp-vc8000e-pm-v1-1-6=
c171451c732@nxp.com
>
> ---
> Peng Fan (2):
>       pmdomain: imx: Fix i.MX8MP power notifier
>       pmdomain: imx: Fix i.MX8MP VC8000E power up sequence
>
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 46 +++++++++++++++++++++++++++++=
++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
> ---
> base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
> change-id: 20260610-b4-imx8mp-vc8000e-pm-v4-1-a978b40c59d0
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>

