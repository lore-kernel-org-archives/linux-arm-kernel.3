Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8B7CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 09:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1JsjvqyGuqGJ2AUuXYyxfGScXM8BYsrNI9EyivldDU=; b=lG4Mb8krrIxrseLopQj/sYoPtc
	TJ2wzWvZAwEsEm0+rB60SHNiB6CFwyQluiqkT/LTDglvrW9BYQQJY/5tIlaZQMWHDiBWEYJlcxz1D
	D4SkfRYoCldkqJj0BJa4W4Aw14vhiu081RJusDzhzAsnPVHAp1LYm5YlLXE3f459YqgBbFdJ3sMtD
	zjiXzvHP6qfe0v5ckHeyv90VOjal/L90wp/nJiMwlmzQ+tTXBLHYfAqgZwYXxS5gSA+MSMQaX1R9i
	oW180SW5KZWZK3nv2dYyVknXQFBQhGsd8vxL98VmumnJnzBYW46wHgDEOqbhFsAGKJaFW9lCOr2zz
	f1+L3S9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKF8-00000007XY6-1T0D;
	Wed, 24 Jun 2026 09:50:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKF5-00000007XWl-3R1H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 09:50:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5tuw22438899
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 09:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J1JsjvqyGuqGJ2AUuXYyxfGScXM8BYsrNI9EyivldDU=; b=SjFpc78bDHurmRP5
	jZ/vVuS/1MXvmhvtNjie+4rISTrAhhpO/Agdvagxpm9UKqfxv3wRRVEOF3vrgbVR
	X+IKrca26ixW2Don9WAia1+dKnmrqjkZ44spXq1wS62peJxMX2P8/naIkLvZWuhA
	5WVhoubztpGiy3Ht19xSi9cWeBvSY/o3SjDkQygdFLFBW76X8maVSKk8PxeVu3KX
	Fwtopjq0GH/ZT7TUkgbCP7i9DjruCPtFpEWUAfK4sx/RRUeTzUZ+LpetMhgiCP6h
	OrtE6BbzZ9hK3cjKHduicu5ROhFaF6irN1ulSu7vEfR2v587uzH7KKKOvrnfu0qM
	MocF1Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ar1kj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 09:49:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso1193319b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 02:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782294597; x=1782899397; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1JsjvqyGuqGJ2AUuXYyxfGScXM8BYsrNI9EyivldDU=;
        b=bJNLSQNSlMpawyO4XboPf69aLvQPvmKY0DNoFhOsnmYwGtYNLG88lbS6twQK/qtY62
         WBbKD9bDpJByCQZyquEA9gn27bNNpo77XQhwdq1TnRHBCX+EiBc0yp1KtvICVg7SwA1M
         lhSwaGlRrdrqUiEMyTPgpuxSUqNOgcWnnRHJHS9OGCtjS1EWkjREe2zJNi2QhVB+KIQi
         E1TpXwrL+2RJovLA4q7P1JgR+G9Y7ZN2AIqbxG9JwlYYKC53PXJnJIRJcQRhksPjrDyN
         XijTvY2bA0AS2rK1ho9FJDpN200Aiq9vJ+ZXYjiHHSUqvZH1FRAmzeVX33mXRtyVmWu/
         Aybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782294597; x=1782899397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J1JsjvqyGuqGJ2AUuXYyxfGScXM8BYsrNI9EyivldDU=;
        b=J7mPG5XWwOuK9D9nOIrwb28xbT/wnD2IYEXi6NvqeYd4T/xhaOBZqPVtOGoyWYOo/z
         5QeZWIz3biLy5zHxmIgu4TlZ6wwXgBh3Hx8bLn3evmHDiQWP/12oacNGv9meUbnGyb6v
         UCaPRfboFuKVjMJOS8bfSPgH+O/UECXa4gVN3GTgtlBCe8zBl2OcTrM79+5RhttfXLwk
         4kyBbAorGRsu5qirwajNxudOX2MnayWLxSbyz/SxNb79w7wWJ7Ko8izwXyu88ePeWVv6
         y/lA+OnzBTonjbNdwImkz4GC+KkZHvPn2illIzGRru8s/QTv1BWN2PiNbf8AP0zcL/06
         2M/w==
X-Forwarded-Encrypted: i=1; AFNElJ+rcUDnM9awVVaw6jrRW6xKNH9+Mg2faYOEldW+ROLkqs+TwE1ODki5zG02HXehuRXJP0/4YQEX4HAOyL+BLpKi@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/0VrxPJH6QaqnTkpm6S0ai6xUPMYRit0Uk60WjaaNP5mS9us/
	+2A9+Mhsnd1FTIjbM9N38SvQhjWlISuTHZ1RnlLDepLpAmlLUPgYoi9UI9SnMZHnl0QZzuDi+XE
	rnGCK9oYyAnhKQXEcu4nnzDmIQmyGTUzdojEKDA0UzP0oaiFRw4vQR81ZW7WLmuCU3lzJcpit45
	+PbQ==
X-Gm-Gg: AfdE7cnFJCleOqo1LQvooWRQ8nkDppU0zw5mQ2sxxuFl298pU6LWLDr461YIKcgzIKt
	6XRC1J9cl5FBvMpg0fIm0Ap4Lv1YD+CsD9fH7f5UPmZ3YcfQMIJKjr9gYiJp7P9VDq6zZsektym
	YkeeIw+G6f5dBHEQXaquy7D4ebzLUa3HPOPLeteB71p1nPkAjo+0q4qLZ9UjbFIPS5Co2gytwN/
	hdELSZAXnwsXaDoIXfiurZMGyfGHG0YjdGqSlykXp+H+uAG0mcDXiXlsr4eETGAPJIKTOtwcZgS
	APK7KkJkrNs+/izTvNU7XMJP88wUMgruWSrK7xU/HXkznx+zzISt3SA1oeG7BxkTF3nSg2d9jb0
	U051bE1WNeTF6362R3d3dXCP+iObau4PV5HWtHNlpdGnjByM9B8awk3TtHW4BoXjbqjDmSPgq6Q
	==
X-Received: by 2002:a05:6a00:2a09:b0:845:34ea:75ac with SMTP id d2e1a72fcca58-845a27beb31mr3220454b3a.0.1782294596790;
        Wed, 24 Jun 2026 02:49:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:2a09:b0:845:34ea:75ac with SMTP id d2e1a72fcca58-845a27beb31mr3220436b3a.0.1782294596412;
        Wed, 24 Jun 2026 02:49:56 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3feb7b3sm2161302b3a.13.2026.06.24.02.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 02:49:55 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 17:49:26 +0800
Subject: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
In-Reply-To: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782294579; l=1011;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=NOeWjRx/+N6Tt+3yCcJaVQnYDy9sxYSfEhEFJNU0Krk=;
 b=Wi05gzbNeph1isJpH4EZJiEZGHTd+QoP61914r7LB4+nEaCkaU8hXCuaYbH2LnMooI7P3pklW
 dkn3b8QAuzOAH6AUaGfRLWFuoA2V8qTSVPOqJCCYjdAK7XxTIrHdiY7
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: 0Hhy9Vnz641M_XDRIjH41XSW_HUrvCFr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA4MSBTYWx0ZWRfX2gWnnVpXrN0C
 uH5wGhyIa2a+wF607TzA8nhDxiFkkaVrf8Q7LB2I27cL+iloAhpZ+r8pJwlThuoTaBQF9viVidk
 GK63LNZlDqXPqfZqHBZI3O6ad7b7gPw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA4MSBTYWx0ZWRfXx+sd+8Qh6g8z
 z44TNErrf35lWqxEnmvlN9bCVSlT1tJXpqyU4H+QhhsoNIAZh/hQRfiIZ60+OuroumO0+W3vUSY
 btZzR3UC+aqmRLtIRUHCzNuGB11acNSGjuZvANOg/rLg9wIUKCLNmg/I6ZH3k9Jl2CVHGOBXTO1
 I0WhB47cFr8w2TXP2Og8AsccxThhDb43nfztK1l7h74Ss9JVvM//EKZRQ4mPWq30HwsIUbgGVYV
 pyjgOS/DhC9fIt6TK6i2jub8hmnveyX49qFz58L5LqTOwN0hR8SWARnkDuqjr+xPt7u/i6m3p3H
 2FVWCWLd+J4i/aIfxQPllZKod0b7+TmAD9vSr5n30yzuaH4Y7XhS5sJHESi0IoC1eZ2LE+e6dqt
 bWoWQsjWQ23/cgHz/kxGlCEjMzVujA==
X-Proofpoint-GUID: 0Hhy9Vnz641M_XDRIjH41XSW_HUrvCFr
X-Authority-Analysis: v=2.4 cv=EuLiaycA c=1 sm=1 tr=0 ts=6a3ba845 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=GaqzazX96i3VkeCjfTUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_025000_011324_246DF67E 
X-CRM114-Status: GOOD (  13.29  )
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

The AMBA bus attempts to read the CID/PID of a device before invoking
its probe function if the arm,primecell-periphid property is absent.
This causes a deferred probe issue for the TraceNoC device, as the
CID/PID cannot be read from the periphid register.
Add the arm,primecell-periphid property to bypass the AMBA bus
check and resolve the probe issue.

Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..25820f7c04cd 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5009,6 +5009,7 @@ tn@111b8000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			arm,primecell-periphid = <0x000f0c00>;
 
 			in-ports {
 				#address-cells = <1>;

-- 
2.34.1


