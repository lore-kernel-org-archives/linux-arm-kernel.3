Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD6CC61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 10:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FqF/pFKdhvjVFIbFaRcdom011G7Oq3Fs4HssXxqokMA=; b=3NgH1b1ff5UV6o6njHQv+Ie/6n
	PB4V461+dgZEBa65KIXzZN18bX1xFEpkzlDh5EeVZBK6ViukDo+MR75LdPNHI8kUkidLxj2gZ6Trz
	MK/+skj0GkYdIgzhXdAON6sou5UwANvFmRSYUcYeleBu7og6SnLXzzFL68UDVPSSlmajUbERleFz6
	GQast6VS4szS3EBBlkXw/PIVHlQH/Mum64xySy+dRWfYvO3Y00WQ+mfkpfSze05w/Z1MZ0tevKgqf
	aOs/V4E/CYCKgDki6wWN3cpSOF0cqeKY7wZMO8R1pbp/l5e6D6LuwX1MLpnQ5E7i1drO8T9mWNTD5
	ivUbfNlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzAr9-00000002Hqq-0nkA;
	Wed, 26 Aug 2026 10:27:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzAr5-00000002Hpc-1WXu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 10:27:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGosp631094
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 10:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FqF/pFKdhvjVFIbFaRcdom011G7Oq3Fs4Hs
	sXxqokMA=; b=W+Q+4SpVqz9ejYQlSvt5l7ukSyfc5ROPRWIcw/r6+1/zD+VHomr
	yPU1pRVgMjR4iwz3+fCSC6EV3osKC2qgMO7rOIObmiUTMQuGtnLutiLi95NO5A68
	eN/7W8z7h15krKQEtgA0LpHI8/mnqPnduJAtIPUbOMHYvd3vNPsXzxQlgS9I3WGd
	Vkr7BXW5p23g+xrt+tarXk/6hEaZjGuk0GkbUiCR10S7NkLek6vwDNqR26jjEvdi
	BXUIC2KCg2bb29mgBHpsnEdIARdSh0/LMKi7D4JKDCk2I1sWNFkX60R3j1aLET9Y
	tMzUAmvjhKY4Kq+aNfIfdoCDiXqTjorQntA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k1ncx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 10:27:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9372b9db132so58594285a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740057; x=1788344857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqF/pFKdhvjVFIbFaRcdom011G7Oq3Fs4HssXxqokMA=;
        b=PKtEnF+CJ/n1J53ktf72WH7E2/M4aUDXK2bPNORH8OhnbmXODy11/8fIwFcsSS1Qmx
         JooGU7zbGEP8+um3rZcZ5P2c58fOl3FBQ7o0OYFi1Ht1TkeyXT2O0sPET0S5esSudmSw
         PKvyJMMGcTZgLwSR+tKADYgIAddulw6nMWbwiB1WXKhR3l5cKA7Z8rePOqTyQrSAgx1b
         wy1d2ansO9aivQDk800qdwuUSoRxXD2aofVR9CThYbez/SFqkIWeS/06Ncf/07XMFIFu
         67EA3WiMvbCvurM5ojl7Gd0hz1zL+S9T7U7BvvWHLjIsgOJ/vt/BMt/UB3jGE7tPNWCz
         R4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740057; x=1788344857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqF/pFKdhvjVFIbFaRcdom011G7Oq3Fs4HssXxqokMA=;
        b=sBnJJYdtBns9pfSDYlDBzCKbbZuvnjstPzC2jhp7ZmSkUrZP2fjPLoRefbxyRn9sGB
         A3xgCVs94PJhFnAzpLALEx2tVBSLtvFPRM6gCBHngH2JQrrnh01v9j6noM/ItMhoBIon
         orUyU4IWGWwK1Qm9LumZRjqFXSkqq2DooaB0jwNtJrbTaFoSjlyrXuec499gono7wqSH
         blXE5AgmbXoYcwDKZA4IGoViLOf4cvWDar8eSMWbqo3mtNErjRmhd8oyz7iTo1opeXZB
         h27xDDIhZAT0XBgBt4zuKdAoKWFUYgjIm2aR6yF7tOznBS7/JLGicszebm/yCBVYNSwU
         obyg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/Q8OyzpiiBPeQy8MdtnWUEYiYntgm8sHdox8OWPunL7zcyOpZCCmC+DOwGrxZH7RoJs/XHqMHg140+8l03ux0@lists.infradead.org
X-Gm-Message-State: AFuF++nZ+ri9TSunwemAFW/zFq+ksjkKYiwTM3+ojAH+B5IS/s7nR+m/
	ZHqjumxok1nN9ZjQVHSt1eh3t8ufqq6+xP0K8yKpvaGJTBpk5JfyKrVJ+/WBwU2+JijHW5Y9a0q
	Zzqc+eLq1LSWoC5DXiAQsHwgbGf9KIh/m5oGTHzySfRad7x8K0P2zcG6Y9omSmWP6GSeuzIfQdm
	cWOQ==
X-Gm-Gg: AR+sD10Gn8Yb9MbA8LdXrYKdx91y8NI/oW/V406KISpr51/iqg7D9EMFbnsHephpepA
	FlpC7qFdm7BDSgrUKps/WMt7w6FbQ5IJGiBbGbjoPbC3gFCy9x+zeHm/hg5LMu7dAAzM1IzwFEq
	+8cRustOPnQZZeffqxIvp3LV3TPw9f26bWs6yulrTgnWe+/2B9kEUQiop/96mGx+a1Hgx7U9tcB
	+WOFkjQ1vBqCZ5N22FVFxlPLUc8EzFhDarSZVyFbJi8tZIb2TTZMh5zUn+reid1qhTulGeq9x5D
	alF34yoryd8h6wjPsIePRHSlm2jk9Hqbt3s+kuW5hz+Ecb+9e9gaAzJ0YWmI/BxzTLVl4+/c50h
	k8iGgvlscOSPywMk6miy7nNn+hguttXouFbcXbuMM+/SlsOcqwCeu3WUH2wkTrj3+iuG0l4QymX
	L4Nl2cxw9f5ZVbxG0=
X-Received: by 2002:a05:622a:4a83:b0:52d:cf84:e98 with SMTP id d75a77b69052e-52e423a4a9amr55060911cf.33.1787740056709;
        Wed, 26 Aug 2026 03:27:36 -0700 (PDT)
X-Received: by 2002:a05:622a:4a83:b0:52d:cf84:e98 with SMTP id d75a77b69052e-52e423a4a9amr55060421cf.33.1787740056283;
        Wed, 26 Aug 2026 03:27:36 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d68d1sm506364966b.11.2026.08.26.03.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:27:35 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] firmware: arm_scmi: fix module auto-loading
Date: Wed, 26 Aug 2026 12:27:31 +0200
Message-ID: <20260826102734.31766-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8ebf99 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8
 a=7CQSdrXTAAAA:8 a=QYgjaYqrS4LJc6J_j6wA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX4z43d4YL4ION
 riatEAfJP2RkIMW7yzVXHJ6NbyjEhMZ7eBM9clV3F2860pDiA9vKxuHjCHrC5yj8YFeyN3aYxOI
 +xEQpzWmgUrEdjuRdC63Q9dXnOsWk9M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX0mzeG9eCt603
 sUNbPzb81YG7MXks2+FJ1S8SK+3yFe1+D8TVCYNJIS1j7GNSoNTfZ2USz/Evy6pfscMeQ9+rK3Y
 yJrsKROzL9qlxGXNtOsTFL2fkBoWGmlUBe5twk77MqROZLDap40aJ59slYauZpn7rAPrumCrMnz
 2A0Je90Ov9P5o0gOxvh3wmHYABNb3H4TLnwMjNK5aWRjdCgznIqGsTa7iB2YtQLE85ieWfcpL4W
 jaFJ+I8Nojcb2JFhwAvEM9dyON7Nh8nyURTuq/LYIH1icWAqYz+i2uyxobg5JyMFyuwPhWDcX/G
 /HMlTfL0wqI/e7acX3wspSRmMqLwgqmCQ9IvzbEEDM2xFrIEXsLptIjipdxMZ1hoXN/ReK4UsfT
 mejXxZGx0KcM4DSkR5nhT7g5TqoTTjgzxrNZHB+o6Eis3QUzof73EkD1p0DAasMyjFKluBmbrsZ
 AAX2GnrjtAcI/aM/Gdw==
X-Proofpoint-ORIG-GUID: vcxHWhRpBONuyQQVu6v0ui_Rjpyzskou
X-Proofpoint-GUID: vcxHWhRpBONuyQQVu6v0ui_Rjpyzskou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_032739_410667_AE44A781 
X-CRM114-Status: GOOD (  18.96  )
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

Changes in v4:
- Drop unused driver_data member from struct scmi_device_id (Uwe)
- Drop device-id/scmi.h include from mod_devicetable.h (Uwe)
- Add device-id/scmi.h to devicetable-offsets.c and file2alias.c (Uwe)

Changes in v3:
- v3 is the first series combining Bjorn and Christian's work see above.

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
 include/linux/device-id/scmi.h    | 17 +++++++
 include/linux/scmi_protocol.h     |  6 +--
 scripts/mod/devicetable-offsets.c |  5 +++
 scripts/mod/file2alias.c          | 12 +++++
 6 files changed, 93 insertions(+), 23 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

-- 
2.55.0


