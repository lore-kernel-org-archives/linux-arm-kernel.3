Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FF9C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rh1eLSVVlNLNo/CfcBH9x58GeH1IP8v1OBx+qCItK94=; b=CLjA2hFE4X4xCiVhIj79CPsWMK
	27+i+2Bz3XDzDqaIxr3aFfCdQ43pZxXfkMT0+Nk59s+kI9LhJyJepHxmn0Loqn6kaxxWaW2OsUtHw
	PKkWusLEJ5sCAhI8sgyK6bZ/IJdeALsEZKFnlhbyoOtuNY8qXxJvVM42RaHhA9mSeTWq6nyLz44A0
	MT4jAwBrf+rfOJcjz01Mo3HHBmreXMaQ3NkowzRIy2jz0EF8MouwrtCAQkkQMsUFUrUYEAcAp7gcK
	giEJ9XTIlz0UlNodxr6/s2/CeEuHIZoEKwaCOdLz2nR30WlwyWVPTQekCgN6pNgUOKJNUjZBV3OVl
	IvKupQGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqs4N-0000000H4jP-49kd;
	Mon, 03 Aug 2026 12:47:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqs4L-0000000H4ih-1wRW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 12:47:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673C4T0h547862
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Aug 2026 12:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rh1eLSVVlNLNo/CfcBH9x58GeH1IP8v1OBx+qCItK94=; b=bQtZJW7xURfw1K8P
	JbrKy4C7zNGt1oX0z9cL1YPZyNfKYOyvQ1Pt6zPn5e5nqoqMHPrzG6hgmDp+6x1L
	lswiM2dP5b9ZPLaW3lh0SNMKZqa+meLz+PBIBuxm9WrZiFPRfjadaJArQLDWszq+
	B09qqt68o2bupcFzO7iDHlj/YdhkUqk8lLzT65cZl//Jwz3NnNHjjijPojl050HD
	86SOyeE0v7OoKJMzHNs89R6z0C5qYmmd+Gzo74w1oAiUAoKnql8/RnY5+nAt7xcj
	aBZm2txyrKJP3uznCisBzRH1AemgWaqBkKvJ1lEkSG8ktBoASGCunmYba5IhAbUR
	i80e8A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvnhhf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 12:46:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccd1958e8fso50682765ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785761203; x=1786366003; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rh1eLSVVlNLNo/CfcBH9x58GeH1IP8v1OBx+qCItK94=;
        b=cnRwduVpbbvTgK54GH54ezEMk0TfMVV7O7NeigH+nZejq76DEQYiQcPmC3yzux2Vbd
         eYiJNc+C9e0P9O9vSizQFy/D7fjTvhwsSo+FYUo54Nah02t+wlsMGxvrD+dCBvavb7Ut
         1o+65i5hEUfGjrDyRouZYWl35k2cAVaf+UJ3C1LjP1VFiQuRMVHBUVSxxcDt30T8ZSBh
         ctRRiB9BXtT6dXmsEBhq7Zefrgj0Zmr3b9J6uxBVNiB9cn0lapVSMq0KGr72Qyd3DSsR
         AKABB/Ky99LUMuakcVJEmPrdAIV38Fh/A9+tuTz1bRLofshhoMw8DJeQsiVCyFJyuyFa
         pv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785761203; x=1786366003;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rh1eLSVVlNLNo/CfcBH9x58GeH1IP8v1OBx+qCItK94=;
        b=VSOtbjg1VLOITTwCQg3av8xOK+R2C2wlGcZwivb34KWSPmMOYz4UYQLDgEb94DxHFs
         Mc5/LCKZNiZ46c5kbaZ12HXCtu3KrIlA8Dad5KhNoDDNAJhpPtFVeSOB6FZjY+hIPXJ2
         goWJuWFmQFTxSvtLmF+mWA+r4xwyL92aclS6+A4Mk1rP6YktqpqGCuxjcG88N+iVvMGg
         6vOHziJ0RyBdsmS7Gx38nkmcqw9+zfJ/NAOFej3gjDBVXvZMxoo8V8xLTcIR8aJh8dN6
         UIIYPQ2xfNFL+75b7jrx8iwC43UEAQ+zQGDPba6EeLz7Etdo2lvePWJ/+lEw6j1mQlKj
         VkTQ==
X-Forwarded-Encrypted: i=1; AHgh+Ror3mjp2rbfaIAbXFa9kiwUdGIhaF0XwByl586J3abRJR2Tt0SwXmLo9icoyHruCCbPSO4A+9aUAXnG+LagUN5t@lists.infradead.org
X-Gm-Message-State: AOJu0YxmzNc77DzcOAWAEsvB4woZ1M8Rb3aPXkwniHkoBZS6EA5W5UHQ
	SJZmsAGE+v6YXe4Warnb21Yx0iRSpLz2TX9hbxj/CVKs/uGnI8hUKuNrbf7uXxrVcFWT0ZNmg2S
	8MeIs9gdNYKNVhVcB02WnUcufhPK5uFNmjli8vWA7YdA5g+Wz4Y8Jea4io7DlcauT2gk9211UCB
	Q2Hw==
X-Gm-Gg: AR+sD12xB0Fit2MwPVylMtXEEWsuaAK3SzAxbghvtqujF5s7VW6A2qUIGb7l6oFvxcP
	h4ddHWJb2V86XFvOqvbooDTzWHJqG57jj0RSMPhhN03MKjJAtogYK+6gac1Xnibdmf3a70UJA8/
	Su039p1Xtgurmht66IEXAkkQL/Sv+H/UxDyt6Ik1w9ZRM+1xVIpcRbvSWUXUhOdd8H8GF0lhENE
	5gzoRq9q5Z8BYSaswyOAGQTP7LCS4RYqfCblepegY5Y08LZMOy8HBfKE+/0j12oh1WB8U30WAsj
	/agsSmmxaSEsCrmbm2ANPWt4WGwWOL1AHqeqU/t7HPTeCedGaAvoHWYghBYv6S3GeZi/KtjneN3
	3Gs0pvwyF2Y0tgqPq7HDa6x+crs7zFbQURw==
X-Received: by 2002:a17:903:37c8:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2d051efd46amr97307405ad.0.1785761203060;
        Mon, 03 Aug 2026 05:46:43 -0700 (PDT)
X-Received: by 2002:a17:903:37c8:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2d051efd46amr97307005ad.0.1785761202596;
        Mon, 03 Aug 2026 05:46:42 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae193fasm37538085ad.7.2026.08.03.05.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 05:46:42 -0700 (PDT)
Message-ID: <14c7d776-a1e5-41a6-aa47-a9ff16516c81@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 18:16:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 05/12] dt-bindings: arm: Document reboot mode magic
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Christian Loehle <christian.loehle@arm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        devicetree@vger.kernel.org, Andre Draszik <andre.draszik@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        John Stultz <john.stultz@linaro.org>, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Moritz Fischer <moritz.fischer@ettus.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-5-889281373870@oss.qualcomm.com>
 <178575749351.2483197.6720070407824857023.robh@kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <178575749351.2483197.6720070407824857023.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a708db4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0awkmHLjsCMGZ7zvgVIA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 7wTYxcnWEK8XJ1EJuoo9CkoPFNqeufQ1
X-Proofpoint-ORIG-GUID: 7wTYxcnWEK8XJ1EJuoo9CkoPFNqeufQ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDExNCBTYWx0ZWRfX6jQUJUMSMbPb
 uyV5PtfSMer5TIjqcfbqkR3H/oxFnIL3FO2yhBNtJ8XiVuVQaNDF28kKISbHonVOVmdgCvlYJwa
 3CHjZTQU93/IB6RosSCYVivdpjZL9n+hK/mEz9l/0OzOCTijODf0hBD29mHuamWpQ2kzSthp3kQ
 7KpbnVBg+UJQzeYYYJ2IiB1Ny+r1+8sFc83+Ld7sVwKT45Olnubejyi8XpgxJjNFonPqJMq4pio
 0Y7G04RYR8uzbCigL7f04b/hVuXkkVVs/jiIkfHUI4YO0Zrv+VZagkSdw/uIO/3HVlgbMMaVzEK
 dXbOOzna8tXdhGlQlQsFuJbmfdaE2FHXWKQktK0PA0Bhmfmwy3CKS8PQkSrwi0zHU7ZWu+NWIdy
 fe+C321gpFFv4RRCJIkjF9YhtIvkzkVHh8gYCOOtDFYVLYFdu21dMiw+gv6mUi9EXCTMwgTYle1
 E9kiWx6d1MFzxlsR42w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDExNCBTYWx0ZWRfX4z4j5Zkf6P1P
 amj1efS/HVPtlivs3a1pQzgeZGgDSv41qR8Czwvqcyoz+ixLaqLKaGy7MBWgvRvL+gM965h3MN5
 sCR0JSmKPRDoORdN+M3b82zdkbNOmOA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_054701_617422_67D7F099 
X-CRM114-Status: GOOD (  22.01  )
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

DQoNCk9uIDgvMy8yMDI2IDU6MTQgUE0sIFJvYiBIZXJyaW5nIChBcm0pIHdyb3RlOg0KPiAN
Cj4gT24gTW9uLCAwMyBBdWcgMjAyNiAxNToxMzozNiArMDUzMCwgU2hpdmVuZHJhIFByYXRh
cCB3cm90ZToNCj4+IEFkZCBiaW5kaW5ncyB0byBkZXNjcmliZSB2ZW5kb3Itc3BlY2lmaWMg
cmVib290IG1vZGVzLiBWYWx1ZXMgaGVyZQ0KPj4gY29ycmVzcG9uZCB0byB2YWxpZCBwYXJh
bWV0ZXJzIHRvIHZlbmRvci1zcGVjaWZpYyByZXNldCB0eXBlcyBpbiBQU0NJDQo+PiBTWVNU
RU1fUkVTRVQyIGNhbGwuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogU2hpdmVuZHJhIFByYXRh
cCA8c2hpdmVuZHJhLnByYXRhcEBvc3MucXVhbGNvbW0uY29tPg0KPj4gLS0tDQo+PiAgIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcHNjaS55YW1sIHwgNTggKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNTggaW5zZXJ0
aW9ucygrKQ0KPj4NCj4gDQo+IE15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAnbWFrZSBk
dF9iaW5kaW5nX2NoZWNrJyBvbiB5b3VyIHBhdGNoOg0KPiANCj4geWFtbGxpbnQgd2Fybmlu
Z3MvZXJyb3JzOg0KPiANCj4gZHRzY2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoNCj4gL2J1
aWxkcy9yb2JoZXJyaW5nL2R0LXJldmlldy1jaS9saW51eC9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL3BzY2kueWFtbDogcHJvcGVydGllczpyZWJvb3QtbW9kZTpw
YXR0ZXJuUHJvcGVydGllczpebW9kZS0uKiQ6IHsnbWluSXRlbXMnOiAxLCAnbWF4SXRlbXMn
OiAzLCAnaXRlbXMnOiBbeydkZXNjcmlwdGlvbic6ICdhcmcxICh2ZW5kb3Itc3BlY2lmaWMg
U1lTVEVNX1JFU0VUMiByZXNldF90eXBlKScsICdhbGxPZic6IFt7JyRyZWYnOiAnL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyJ30sIHsnbWluaW11bSc6IDIxNDc0
ODM2NDh9XX0sIHsnZGVzY3JpcHRpb24nOiAnYXJnMiAoY29va2llX2xvIGluIDItY2VsbCBm
b3JtLCBjb29raWVfaGkgaW4gMy1jZWxsIGZvcm0pJywgJyRyZWYnOiAnL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyJ30sIHsnZGVzY3JpcHRpb24nOiAnYXJnMyAo
Y29va2llX2xvIGluIDMtY2VsbCBmb3JtKScsICckcmVmJzogJy9zY2hlbWFzL3R5cGVzLnlh
bWwjL2RlZmluaXRpb25zL3VpbnQzMid9XSwgJ2Rlc2NyaXB0aW9uJzogJ0Rlc2NyaWJlcyBh
IFBTQ0kgU1lTVEVNX1JFU0VUMiB2ZW5kb3Itc3BlY2lmaWMgcmVzZXQgdHlwZS4gVGhlIHN0
cmluZ1xuYWZ0ZXIgIm1vZGUtIiBtYXBzIGEgcmVib290IG1vZGUgdG8gYSB2ZW5kb3Itc3Bl
Y2lmaWMgcmVzZXQuXG5BIHZlbmRvci1zcGVjaWZpYyByZXNldCB0YWtlcyB0d28gYXJndW1l
bnRzLCBhIDMyLWJpdCByZXNldF90eXBlIGFuZCBhXG42NC1iaXQgY29va2llLiBUaGUgYXJn
dW1lbnRzIGFyZSBlbmNvZGVkIGFzIHVwIHRvIHRocmVlIDMyLWJpdCBjZWxscy5cbkVhY2gg
bW9kZSBwcm9wZXJ0eSBpcyBlbmNvZGVkIGFzIG1vZGUteHh4ID0gPGFyZzFbLCBhcmcyWywg
YXJnM11dPixcbndoZXJlOlxuLSBhcmcxIGlzIHJlc2V0X3R5cGUgYW5kIG11c3QgYmUgPj0g
MHg4MDAwMDAwMC5cbi0gSW4gMi1jZWwNCj4gICBsIGZvcm0sIGFyZzIgaXMgbG93ZXIgMzIg
Yml0cyBvZiBjb29raWUuXG4tIEluIDMtY2VsbCBmb3JtLCBhcmcyIGlzIGhpZ2ggMzIgYml0
cyBvZiBjb29raWVcbiAgYW5kIGFyZzMgaXMgbG93IDMyIGJpdHMgb2YgY29va2llLlxuXG5B
bGwgdmFsdWVzIHNob3VsZCBiZSBwcm92aWRlZCBhcyBwZXIgdGhlIFBTQ0kgU1lTVEVNX1JF
U0VUMlxuc3BlY2lmaWNhdGlvbi5cbid9IHNob3VsZCBub3QgYmUgdmFsaWQgdW5kZXIgeydy
ZXF1aXJlZCc6IFsnbWF4SXRlbXMnXX0NCj4gCWhpbnQ6ICJtYXhJdGVtcyIgaXMgbm90IG5l
ZWRlZCB3aXRoIGFuICJpdGVtcyIgbGlzdA0KPiAJZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2l0ZW1zLnlhbWwNCj4gDQo+IGRvYyByZWZl
cmVuY2UgZXJyb3JzIChtYWtlIHJlZmNoZWNrZG9jcyk6DQo+IA0KPiBTZWUgaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2RldmljZXRyZWUvcGF0Y2gvMjAyNjA4MDMt
YXJtLXBzY2ktc3lzdGVtX3Jlc2V0Mi12ZW5kb3ItcmVib290cy12MjQtNS04ODkyODEzNzM4
NzBAb3NzLnF1YWxjb21tLmNvbQ0KPiANCj4gVGhlIGJhc2UgZm9yIHRoZSBzZXJpZXMgaXMg
Z2VuZXJhbGx5IHRoZSBsYXRlc3QgcmMxLiBBIGRpZmZlcmVudCBkZXBlbmRlbmN5DQo+IHNo
b3VsZCBiZSBub3RlZCBpbiAqdGhpcyogcGF0Y2guDQo+IA0KPiBJZiB5b3UgYWxyZWFkeSBy
YW4gJ21ha2UgZHRfYmluZGluZ19jaGVjaycgYW5kIGRpZG4ndCBzZWUgdGhlIGFib3ZlDQo+
IGVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxpbnQnIGlzIGluc3RhbGxlZCBhbmQg
ZHQtc2NoZW1hIGlzIHVwIHRvDQo+IGRhdGU6DQo+IA0KPiBwaXAzIGluc3RhbGwgZHRzY2hl
bWEgLS11cGdyYWRlDQo+IA0KPiBQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1pdCBhZnRlciBy
dW5uaW5nIHRoZSBhYm92ZSBjb21tYW5kIHlvdXJzZWxmLiBOb3RlDQo+IHRoYXQgRFRfU0NI
RU1BX0ZJTEVTIGNhbiBiZSBzZXQgdG8geW91ciBzY2hlbWEgZmlsZSB0byBzcGVlZCB1cCBj
aGVja2luZw0KPiB5b3VyIHNjaGVtYS4gSG93ZXZlciwgaXQgbXVzdCBiZSB1bnNldCB0byB0
ZXN0IGFsbCBleGFtcGxlcyB3aXRoIHlvdXIgc2NoZW1hLg0KPiANCg0KdGhhbmtzIHdpbGwg
Y2hlY2sgYW5kIHVwZGF0ZSB0aGlzIHBhdGNoLg0KDQp0aGFua3MsDQpTaGl2ZW5kcmENCg==


