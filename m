Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B884AC5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 19:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x2Cmaab1c8skxG2XWMAOAO6+MfGSdVWYe9eRT+Q7FR0=; b=fIPF7nfJDQyeB8zO6sBrz1Pe4r
	B4O8Ul5w22+yo2vzTDPVKe8F3hwA75GHuH5vYSUpBssv+6zLCpPWKQpkLjSf/gfkGYURPQXlunhNI
	kkLeE+ftSry3j6SgJGw0ZcVCTih5d5mml39+sUzt+bP/JahTrvEx/Zl/rWEtU07+7cOUaj3Ejp8AW
	IOOEnT4utMrkpRbVPbViLHzmrhAywX6cTkDm1xw6T/2aXCGl1f+n66UYmkAeNkzd3lfirYrzd4udW
	6YTHDcZlAem7Tp+Y8K6uNYAvnPwA1looLUYlXZ4HdkJbDHKLW2ZJleTz2f/wmF0Qmo2zoW5dQ1rJF
	M7V/r5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8l1-0000000C8eF-49ka;
	Thu, 20 Aug 2026 19:48:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8ky-0000000C8de-3KHh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 19:48:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIJ5OF3259546
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 19:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=x2Cmaab1c8skxG2XWMAOAO6+MfGSdVWYe9e
	RT+Q7FR0=; b=DOWetbHjIo3hBlH5OepFF2/oJtZ9sj1U5SchZFWIhPK9l2Wv4yA
	wku2TSLme2SYWGRTyUNtwtxGkUq0f8aTT8+W9YjBaFuZpOgWkwL+Rz2rvIjMt2TX
	P1zt+CMJGxoNXfLp7KzLU7+Kw4EofrpCUqYwSW3R327aMkwwJJAqqBFCsZZfZ8Jj
	fU8em8swmTbbBkz0MJJ0YhWmzRC8HZXDhFL8dNdMIL3hgoQscfu/mUTM+hg9R8v7
	G5QZ4bXXVccc8858rLayGlRBhA3r6dA0wkJQmHmIStKX8ooYO1ISX9h+rDYa2afT
	Qt3SZFMXTU9KJRmo4htp0GnEV5FMMgZEKYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ytcamgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 19:48:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5e38fbc5so25397185a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 12:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787255335; x=1787860135; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x2Cmaab1c8skxG2XWMAOAO6+MfGSdVWYe9eRT+Q7FR0=;
        b=V+JdYosdV/AI4HiYDaQoJCWaNRy3uqzoRSLTIef6hDsz/zgezFZwe2ltjEv6MFF+Tc
         E2EETy2NpQV4MmkvQObwCuz7/sbW57lhH+Q6DREl+GdbSpb1AZ4NxMlaxxNkmKAAOLu9
         Kl7Dyn4F3PMduFoC4LIVfztMrLRWNxBMXttsdLbxFA3MWFl3qPosNeBS68/FYAc9vj7r
         hJrlNNGe+TaoF+6acRFs0azPzDgQ52cde/bdXGloE4udx+Bquv6AwpnsdRGfUF9Dvat4
         2voSvUJJPo4/dzZtjGiXA8aYHdGtBl8T1C9mdA+Qlh7WFysiSColcfChKnkOCESXDU4U
         jk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787255335; x=1787860135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x2Cmaab1c8skxG2XWMAOAO6+MfGSdVWYe9eRT+Q7FR0=;
        b=nImVdEyK2rfVY/58kmtOm0AYNjy+PoAhZ0RuRMTTuJjOhloHzee2dijpa9GykvYBH8
         0OqsSOa2lhUQK7NBg2u9vP/1qsS3tQXi+P//LQl4iEeF/Z8NdWDeQk4UYgniIS7MM3oB
         WXulx4jhyV2re0bcqfVunmqmPHlrEiR1y8l7OVTuWPuC1r/VANpSDbJohta2fd3Jydbd
         WKY8Xj2MKa3lbbZsl2f0VbKBMxsSQROhtPrJFrC1ivmEHuQGTu7JmpGonW9HhnIgzUow
         Fv7NmRQ+jym/uKCAdRVTSAe18WQwT1JDBso4Ds2MpXUM0e7gCEBi04kgWT+QEKuQd9OH
         5Rzg==
X-Forwarded-Encrypted: i=1; AHgh+RoS+IU9AnXBqLpX3q9l2c+sZ+Ayue/eCcq/hk7VRyJeheQaUNgvyyC6LbyaWl1NLh0krpUFWPFZMlSPZMDNyFuA@lists.infradead.org
X-Gm-Message-State: AOJu0YxofH/pdPhYe7gHaEDLxdk9QiFUioalL82IwYNepYw6QIfTE57n
	e5jm+aJbxwUSz4Q6DNwFnIu67vyYggD8XkWf9EFuiJWUEe3MnUAxgvg1DqUI6S9gjHWMNirCodF
	03vgPfgKuiOXpQeGjoeiHCmMW4504gGK7mi5c5CNGuTavh09en2o5hwNB5E+RBHCNTOH8cl42Do
	IN9/cd5uiPaQ==
X-Gm-Gg: AR+sD11CWdlYa4APHQglscMVWv+KaSHBr4wPfxM2nXl+ed1dkmUoV0fw/A06v9j3Zug
	YXui1G9Iq7aLZf7wqD3UA+gAfJJu4k5l58h3UMgnJlpaRxBPUUxokL91s/rGAVlFgyG0zyrG+Uj
	rHk0/mNy3njxPHJzOiLZbbRG5NXQcXHk3xF3WKBr2izNP/xAxG706/6QJDXGTE+eKlp4ygc6Hra
	pADZSh3wqBrnDF1jdvY7ry1Jme3sxvowDETXoUHy5scPlYWpXv0AvMFG+BhT8EbHaiSelWidV6a
	emh/TymGHagDENQ4xs9xNOwxN/axWPZE5QzMc81hXY3hbcRrBsSskrUahUziVKW4QJbOQgYzpVs
	LmLRuj5yriTAB
X-Received: by 2002:a05:620a:319e:b0:936:ea3d:9313 with SMTP id af79cd13be357-93739497c75mr56869385a.20.1787255335107;
        Thu, 20 Aug 2026 12:48:55 -0700 (PDT)
X-Received: by 2002:a05:620a:319e:b0:936:ea3d:9313 with SMTP id af79cd13be357-93739497c75mr56863585a.20.1787255334517;
        Thu, 20 Aug 2026 12:48:54 -0700 (PDT)
Received: from shalem ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459198ec5sm113433266b.34.2026.08.20.12.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 12:48:53 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] firmware: arm_scmi: fix module auto-loading
Date: Thu, 20 Aug 2026 21:48:47 +0200
Message-ID: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OqZ/DS/t c=1 sm=1 tr=0 ts=6a875a28 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8
 a=7CQSdrXTAAAA:8 a=QYgjaYqrS4LJc6J_j6wA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX6qBiaRRFTV+d
 Z0alOcxXa6sJmqQlcL1aSIN/bxEQfYQiCO6mTSEoaLw5cMojsWTZz4qmc1XWZYFBUeLmov0V9U/
 e2p4eH0tpc6jFOFAaF96Iz3ep5nAcnYItK8Qn7mY2UrV/M1ryIWoRKXECoX2Ghg7R8bOLZQVMdL
 J528iWQs9QG3vfr2PRJdmjxlmY/6AvsV4c22gFPyXg3/Y3wslNSFTYqKhihsYqBKEDUdcAt144V
 pLTEqAaYltgHYRjYgvKotakUh4GuYuvgLTkZraYQhETr6QveqsAVt1Sro965fnvavq/bm4lAPYF
 HqrwkdZbNeeGr0rOhJnbztevsb/Fo8+kgY7nOxtaujBh+Fnqehp2ql5CVCVjDNY52weg06qsM/o
 fU9vzPGMPQmK5OADsWqw+2GIbnSNJgsGJ28vq92mGwwUIcOv6noj5UCAK/FY0IaRGyCEsGU4z0y
 8WnYdsEmgGhhbe7bO/w==
X-Proofpoint-ORIG-GUID: JQVOWopjR-awGiPl_KqDnsW3tDMinIX3
X-Proofpoint-GUID: JQVOWopjR-awGiPl_KqDnsW3tDMinIX3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX54Z0cYc4AByv
 hVPdRHogG/TpCW7B6YoUjpKJyJBeYghd+U4ZJEE1WGH2NP2bBRJSSRARRd5df43NDxmUP/ULEcn
 CV1pYef05TOTA27bjqQg5GnHihBVwY8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_124856_834300_14E84B63 
X-CRM114-Status: GOOD (  18.08  )
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

Hi All,

Here is a patch series fixing arm_scmi module autoloading this combines:

1. Patch 1/2 from Bjorn to add support for scmi bus modaliases to modpost:
https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/

2. RFC 2/2 from Cristian which pre-populates the scmi { protocol, name }
tupple list with standard protocol info to break the circular dep:
https://patch.msgid.link/20250203100154.140877-2-cristian.marussi@arm.com

1. is not enough by itself because driver module auto-loading requires
the devices to already be created for udev to get the necessary uevents
based on which udev auto-loads modules.

But SCMI devices are only created after their { protocol, name } tupples
have been registered which is done from scmi_driver_register(), creating
a circular dependency.

2. breaks the circular dependency by pre-populating the { protocol, name }
list with the standard protocols. This allows the devices to be created
before the module with the driver is loaded, after which module auto
loading works the same as it does on any other bus.

I've tested this on a T14s Snapdragon laptop with Fedora's kernel config
where scmi_cpufreq is a module. With this series scmi_cpufreq correctly
autoloads even if it is not included in the initramfs.

I've added a 3th patch extending the pre-populating to also include all
the { protocol, name } tupples for the in tree SCMI drivers for IMX
vendor protocols, so that module auto-loading will work for all in tree
drivers.

Out of tree drivers can still register new tupples as before but their
modules will need to be manually loaded (also as before).

Regards,

Hans


Bjorn Andersson (1):
  module: add SCMI device table alias support

Cristian Marussi (1):
  firmware: arm_scmi: Pre-register protocol, name tupples for standard
    protocols

Hans de Goede (1):
  firmware: arm_scmi: Pre-register protocol, name tupples for IMX
    protocols

 MAINTAINERS                       |  1 +
 drivers/firmware/arm_scmi/bus.c   | 75 +++++++++++++++++++++++--------
 include/linux/device-id/scmi.h    | 19 ++++++++
 include/linux/mod_devicetable.h   |  1 +
 include/linux/scmi_protocol.h     |  6 +--
 scripts/mod/devicetable-offsets.c |  4 ++
 scripts/mod/file2alias.c          | 11 +++++
 7 files changed, 94 insertions(+), 23 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

-- 
2.55.0


