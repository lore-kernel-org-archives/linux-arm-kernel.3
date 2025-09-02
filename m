Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D610CCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bw74ZDWYln3R5EhzIwK/dVcSfr5R7Z8FO22rXgIrEXw=; b=hqTJpAc7OthC6lx47v5l4863d3
	qfn9r9XabQ0++mmedSgKJBP6NnjF/VCPuWTjSjBW5qh74a7zu0caDX5Y8yXF/ETUYGO3JvpiEXu/d
	EMcgCSe0dw4jAcGgU8vfjGA4bIgNFXFzg3ODq58H/qGJSZYR9D2QH2Xmt2fv5JSad09CFansZZRjd
	3o4cAUPsHQHV0gCaDsBm5r4PUvFbwtoNdWylBupdYCGMmg9EJvlUwkUrtqjzFzVPlcHsgNNtNwsL0
	KQsEdWFN/d3GZMUmn+3ZbyVDr7eGpapZtmD6XQxmsrZ1ctFz747JuhPv+5CGgU+rjsrlDDWipFSrA
	YYJsPNnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ6h-0000000HE0D-3MAR;
	Tue, 02 Sep 2025 12:27:27 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utN1T-0000000GHDB-0ElH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:09:52 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3cbb3ff70a0so3203020f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 02:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756804189; x=1757408989; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bw74ZDWYln3R5EhzIwK/dVcSfr5R7Z8FO22rXgIrEXw=;
        b=cIKqV/IVT3+o5ET7jXhXcYO8RPkZDwXeki4MbVbu2Ch54dB4CkI5sni40SWpyw+xRP
         2fTF4lG6G9w7qHobwdPu+/iUT6vfpZ1SwWNyFHtbNNcf+XtcYqnPquUc+ecOzRmjoFau
         rQMpmNCXDDqyuKdj2zrEDfoOF+QXmXnLep00MdrWVNYko5hzAb/Bw48AFdO/o6tDlzaa
         B1tXYVNP20uC3KeudR0n8bGA4u4iUZSgYzeMPu/1E3sdwVX49eMAQjZW34JY5VlaDQ7S
         qEkBCirbyNlxb4DoXZHn8P/sQMJm4iLNPhck5Oh8f+oFU/iJSVA0VRn2JHykV4jyLPfn
         onhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756804189; x=1757408989;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bw74ZDWYln3R5EhzIwK/dVcSfr5R7Z8FO22rXgIrEXw=;
        b=JQa3meSnXbbixvF+ZXi7ybt7l0GzOXo5saqs8p61gcvljQN0+rqb4ml4pfZ3xy+2jl
         ih3bj/syiUt817NWhbSVDqpSMS9T/bFaLOguJvCx2he4Ce2zVgbYYB09h/VuJkgkabzF
         nIu3//cTJEIVK55u1yKl+Igtwzogtw16nYv+OBontRLk0WAc55uTI9BKVGde/woVxg01
         gz17lqJHJANZGTZid+xbnfDIpCt7ItsKCQf4S7nHvZ83PylPt+nDNlaIoN19LJomtONW
         tJdGNoeYdKvJNOJOtYj4DxAKPGLUvA1KEX4MEbCKHgu2AYImItImXpSBard8slk8MDmM
         7csA==
X-Forwarded-Encrypted: i=1; AJvYcCUTaRuXaF1FS3mSsx+JTyeCTAjQy1349GLC4AyIAegsJmHyd8IZEp72GmC9ygPltzGuiA6G+bDOkr/n1pDOkoCL@lists.infradead.org
X-Gm-Message-State: AOJu0YythsmOkfMKTl8iYW+tZ+lu9g9r99LBuP6fFv6wv3LYOvhazsjD
	O+4TbXJF4pCbJtGUwT+1Y28pGtKplmBKgsO9wr83Jj53fR65EnyWVmky
X-Gm-Gg: ASbGncuum/IseyLB7pRIgMwG1lixh6uvHbC/llFSPIfMGR5TrhL8opuMJmUOD4K8OZh
	tbSIB7/x8MKuKWyNwJJ7165DVf0eN1BXSjLVCRnamcTNCqUY9hWTIgUshAIkuTkU/zE+/T1LJ81
	AvAFejC9qFdpa5UpVTqI4s/AxftfD7iRs0+uadXS/+lYHrdLJPVFl2LzeYHW3MWqw8utXXDjHjG
	1GJCBqX0Wu3e5dUPlh/IXBchTg1vff+ebDKmTI49EEJa/S8yppkj1ic4/MR+o3ad1i3fvAsZEtZ
	Dpe/HMGJFG0s5vG8pMVdhhUOF7jTmjEtHX8/S2W8luLuosNTstLHe7XprCg31J6mZHsDqgeckjT
	PYdg2AmprbB22jji7OX+Dqy1pqUOmEU4Yg/8XhMRpsf7p333b0e0LcPWVRBJ0DQTeM3NqLQ==
X-Google-Smtp-Source: AGHT+IHNGi1WlUp37oda1jCD0mIQM+pwLYeo9d0bEci6H/DuqNOy5AfU0gRE95Kv3q/RMJ5wltAJRg==
X-Received: by 2002:a05:6000:2586:b0:3cd:c10d:3b6b with SMTP id ffacd0b85a97d-3d1de4b9891mr7783573f8f.27.1756804188869;
        Tue, 02 Sep 2025 02:09:48 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:3f02:d36b:e22e:74c6? ([2a02:168:6806:0:3f02:d36b:e22e:74c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33add294sm20017536f8f.29.2025.09.02.02.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:09:48 -0700 (PDT)
Message-ID: <1cc6781ea584aa00a8cda23db1fc8cd59f852a3d.camel@gmail.com>
Subject: Re: [Bug 220479] New: [regression 6.16] mvebu: no pci devices
 detected on turris omnia
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Jan Palus <jpalus@fastmail.com>, Rob Herring <robh@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Thomas Petazzoni	
 <thomas.petazzoni@bootlin.com>, Pali =?ISO-8859-1?Q?Roh=E1r?=
 <pali@kernel.org>, 	linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, 	regressions@lists.linux.dev
Date: Tue, 02 Sep 2025 11:09:47 +0200
In-Reply-To: <42rznc7krv3gdwmdzfz6o5nalnzleiwfg44yleqjet67cu4ijm@pwap3ph2n2u7>
References: <bug-220479-41252@https.bugzilla.kernel.org/>
	 <20250820184603.GA633069@bhelgaas>
	 <42rznc7krv3gdwmdzfz6o5nalnzleiwfg44yleqjet67cu4ijm@pwap3ph2n2u7>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+b1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_020951_096115_DAE39156 
X-CRM114-Status: GOOD (  14.01  )
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

On Thu, 2025-08-21 at 02:45 +0200, Jan Palus wrote:
>=20
> Relevant fragment of mvebu_get_tgt_attr() in mentioned commit:
>=20
> +		u32 slot =3D upper_32_bits(range.bus_addr);
> =C2=A0
> -		if (DT_FLAGS_TO_TYPE(flags) =3D=3D DT_TYPE_IO)
> +		if (DT_FLAGS_TO_TYPE(range.flags) =3D=3D DT_TYPE_IO)
> =C2=A0			rtype =3D IORESOURCE_IO;
> -		else if (DT_FLAGS_TO_TYPE(flags) =3D=3D DT_TYPE_MEM32)
> +		else if (DT_FLAGS_TO_TYPE(range.flags) =3D=3D DT_TYPE_MEM32)
> =C2=A0			rtype =3D IORESOURCE_MEM;
> =C2=A0		else
> =C2=A0			continue;
> =C2=A0
> =C2=A0		if (slot =3D=3D PCI_SLOT(devfn) && type =3D=3D rtype) {
>=20

As far as I understand the situation, of_pci_range_parser_one() inherently =
uses bus->get_flags()
aka of_bus_pci_get_flags() to determine range.flags (see drivers/of/address=
.c).

And of_bus_pci_get_flags() does essentially the same thing as the code abov=
e in mvebu_get_tgt_attr().
So, now the translation logic is applied twice - which probably was not int=
ended.

To restore the original behaviour, I think the determination of rtype from =
range.flags must be=C2=A0
completely removed, and rtype must be replaced by range.flags.

Something like this on top of mainline - completely untested, but maybe wor=
th a try.

diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pc=
i-mvebu.c
index 755651f338..3fce4a2b63 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -1168,9 +1168,6 @@ static void __iomem *mvebu_pcie_map_registers(struct =
platform_device *pdev,
        return devm_ioremap_resource(&pdev->dev, &port->regs);
 }
=20
-#define DT_FLAGS_TO_TYPE(flags)       (((flags) >> 24) & 0x03)
-#define    DT_TYPE_IO                 0x1
-#define    DT_TYPE_MEM32              0x2
 #define DT_CPUADDR_TO_TARGET(cpuaddr) (((cpuaddr) >> 56) & 0xFF)
 #define DT_CPUADDR_TO_ATTR(cpuaddr)   (((cpuaddr) >> 48) & 0xFF)
=20
@@ -1189,17 +1186,9 @@ static int mvebu_get_tgt_attr(struct device_node *np=
, int devfn,
                return -EINVAL;
=20
        for_each_of_range(&parser, &range) {
-               unsigned long rtype;
                u32 slot =3D upper_32_bits(range.bus_addr);
=20
-               if (DT_FLAGS_TO_TYPE(range.flags) =3D=3D DT_TYPE_IO)
-                       rtype =3D IORESOURCE_IO;
-               else if (DT_FLAGS_TO_TYPE(range.flags) =3D=3D DT_TYPE_MEM32=
)
-                       rtype =3D IORESOURCE_MEM;
-               else
-                       continue;
-
-               if (slot =3D=3D PCI_SLOT(devfn) && type =3D=3D rtype) {
+               if (slot =3D=3D PCI_SLOT(devfn) && type =3D=3D range.flags)=
 {
                        *tgt =3D DT_CPUADDR_TO_TARGET(range.cpu_addr);
                        *attr =3D DT_CPUADDR_TO_ATTR(range.cpu_addr);
                        return 0;



