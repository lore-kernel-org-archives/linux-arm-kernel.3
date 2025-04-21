Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DDEC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 23:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:CC:Message-ID:Date:Content-Type:Content-Transfer-Encoding:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OW+FjKgr+O+cpJJ1XHA+YESDflZ1mtQz9BgoDkDH4A=; b=ClV7rpCrmlF4xrHasvcCOMdgED
	rMKvnEFsLla6w8k/71/+cvgLHuBlW5Qh66CvqnyBA+v1m9MDzLGB9qh3LQExoMqTLDGm6EuuvJJhj
	1eXCNcf3z4+NhYJpe17BhVyH18JXh0dQJmLPoK8lzCnWgc0Mf7mx1g7DvplBmfLXI6whb9bB56kWa
	BNPF7dwB8BWADe+Sz1VjK5nR1PVqDaY8raSQxXQaY1FhTAz8Q3IbWWaYKpIMVcbLOJCsw6jBB5lUs
	gR6d0X+XStjZLixVKj4DutY8K+7VanCsEtCUAi8AM/bjimwhA6amg8H1so0kOjTcDNrsKFdfPb3id
	suzeYCcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u70xC-00000005Qkc-2m4o;
	Mon, 21 Apr 2025 23:53:34 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u70vJ-00000005Qey-472b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 23:51:40 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LNpTqf1039141
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 18:51:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745279489;
	bh=2OW+FjKgr+O+cpJJ1XHA+YESDflZ1mtQz9BgoDkDH4A=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=abNSGcUXGMIxSfyLAvWh5xaiAtLz1u+YRM2TwrirqC0yvvM8U/QNwWXTiuKZrx2D1
	 nWm80umC6G8/mEm86/81lQvamCCIVz6NCFv8LaRb6zZuWF2KbmoBGJpOWZYq5SSI5A
	 0H55lK2G2Bsutr60XAQRtmMXUH2ad6oQHKXj04Q8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LNpT99029435
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 18:51:29 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 18:51:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 18:51:28 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LNpSYR033139;
	Mon, 21 Apr 2025 18:51:28 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 21 Apr 2025 18:51:28 -0500
Message-ID: <D9CPY0IDAJSR.39JPPAXZAUNQE@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Frank Binns <frank.binns@imgtec.com>,
        Alessio
 Belle <alessio.belle@imgtec.com>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>,
        Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Darren Etheridge
	<detheridge@ti.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: k3-j721s2: Add GPU node
From: Randolph Sapp <rs@ti.com>
To: "Kumar, Udit" <u-kumar1@ti.com>, Matt Coster <matt.coster@imgtec.com>,
        Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250417-bxs-4-64-dts-v2-0-9f8c09233114@imgtec.com>
 <20250417-bxs-4-64-dts-v2-2-9f8c09233114@imgtec.com>
 <8017c015-73aa-4807-a177-d5391e073981@ti.com>
In-Reply-To: <8017c015-73aa-4807-a177-d5391e073981@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_165138_302854_FF2D82AC 
X-CRM114-Status: GOOD (  21.89  )
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

On Sat Apr 19, 2025 at 11:15 AM CDT, Udit Kumar wrote:
> Hello Matt,
>
> On 4/17/2025 2:40 PM, Matt Coster wrote:
>> The J721S2 binding is based on the TI downstream binding in commit
>> 54b0f2a00d92 ("arm64: dts: ti: k3-j721s2-main: add gpu node") from [1]
>> but with updated compatible strings.
>
> Downstream kernel[1] sha 5657fc069e8b3 ("PENDING: arm64: dts: ti:=20
> k3-j721s2-main: add gpu node")
>
> also has assigned-clock-rates.
>
> Please check if gpu node needs assigned-rate too.

If I remember correctly, J721S2 was one of the few platforms that actually
defaulted to 800MHz, so it may not be necessary for that platform specifica=
lly.
(I don't have a board to test this right now though. This very well may hav=
e
changed.) AM62 also defaults to the correct value, and that one I did manag=
e to
verify.

That being said, Udit is right, it's generally a good idea to explicitly se=
t the
clock speed for our devices. I know AM62P, for example, used to default our
clock to the bus speed.

At one point though this driver was experimenting with a DVFS mechanism. Ma=
tt,
use of assigned-clocks shouldn't interfere with that assuming there is no
defined opp-table, right? May be a good idea to set our usual 800 MHz for J=
721S2
and 500 MHz for AM625. This shouldn't require any binding related changes.

On the topic of opp tables for the GPU, I did some testing on the proprieta=
ry
driver a little while back. These devices do not support voltage scaling an=
d
simple frequency scaling saw a general decrease in performance and increase=
 in
power draw for the usual utilization bursts a single application running at=
 60
FPS generates. I have a feeling this will carry over to the open source dri=
ver,
but we can always do additional testing if you are curious.

- Randolph

>> The clock[2] and power[3] indices were verified from HTML docs, while
>> the intterupt index comes from the TRM[4] (appendix
>> "J721S2_Appendix_20241106_Public.xlsx", "Interrupts (inputs)",
>> "GPU_BXS464_WRAP0_GPU_SS_0_OS_IRQ_OUT_0").
>
>> [1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
>> [2]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/clocks.h=
tml
>> [3]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/devices.=
html
>> [4]: https://www.ti.com/lit/zip/spruj28 (revision E)
>>
>> Reviewed-by: Randolph Sapp <rs@ti.com>
>> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
>> ---
>> Changes in v2:
>> - Add interrupt reference details
>> - Add Randolph's Rb
>> - Link to v1: https://lore.kernel.org/r/20250415-bxs-4-64-dts-v1-2-f7d3f=
a06625d@imgtec.com
>>
>> This patch was previously sent as [DO NOT MERGE]:
>> https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-18-eda620c5=
865f@imgtec.com
>> ---
>>   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boo=
t/dts/ti/k3-j721s2-main.dtsi
>> index 92bf48fdbeba45ecca8c854db5f72fd3666239c5..a79ac41b2c1f51b7193e6133=
864428bd35a5e835 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
>> @@ -2048,4 +2048,16 @@ watchdog8: watchdog@23f0000 {
>>   		/* reserved for MAIN_R5F1_1 */
>>   		status =3D "reserved";
>>   	};
>> +
>> +	gpu: gpu@4e20000000 {
>> +		compatible =3D "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
>> +		reg =3D <0x4e 0x20000000 0x00 0x80000>;
>> +		clocks =3D <&k3_clks 130 1>;
>> +		clock-names =3D "core";
>> +		interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>> +		power-domains =3D <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
>> +				<&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
>> +		power-domain-names =3D "a", "b";
>> +		dma-coherent;
>> +	};
>>   };
>>


